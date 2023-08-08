import 'package:anywhere_realestate_assignment/app/core/api/custom_exception.dart';
import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';
import 'package:anywhere_realestate_assignment/app/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//custom rest client to handle api calls that makes use of the dio package
//and makes calling requests from the api layer easy & clean
class AnywhereRestClient {
  final String _endPoint;
  late Dio _dio;

  final connectTimeout = const Duration(seconds: 15);
  final receiveTimeout = const Duration(seconds: 30);

  AnywhereRestClient(this._endPoint) {
    var options = BaseOptions(
      baseUrl: _endPoint,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    _dio = Dio(options);
  }

  Future<Response<dynamic>> get(
    Api api,
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    _setDioInterceptorList(api);

    final standardHeaders = await _getOptions(api);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .get(path, queryParameters: queryParameters, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> post(
    Api api,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList(api);

    final standardHeaders = await _getOptions(api);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .post(path,
            data: data, options: standardHeaders, queryParameters: queryParams)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> put(
    Api api,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    _setDioInterceptorList(api);

    final standardHeaders = await _getOptions(api);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .put(path, data: data, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> delete(
    Api api,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList(api);

    final standardHeaders = await _getOptions(api);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .delete(path,
            data: data, queryParameters: queryParams, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  //dynamic options for public and protected api calls
  Future<Options> _getOptions(Api api) async {
    // normally this would be something like...
    // AnywhereDataImpl.instance.cacheHelper.getAccessToken();
    const apiToken = 'token';

    switch (api) {
      case Api.public:
        return PublicApiOptions().options;
      case Api.protected:
        return ProtectedApiOptions(apiToken).options;
    }
  }

  //handle dio exceptions and throw any custom exceptions
  //so our controller layer can handle them easily
  _getDioException(error) {
    if (error is DioException) {
      logger.e(
          'DIO ERROR: ${error.type} ENDPOINT: ${error.requestOptions.baseUrl} - ${error.requestOptions.path}');
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw RequestTimeoutException(
              408, ExceptionStrings.requestTimeoutExceptionMessage);
        case DioExceptionType.sendTimeout:
          throw RequestTimeoutException(
              408, ExceptionStrings.requestTimeoutExceptionMessage);
        case DioExceptionType.receiveTimeout:
          throw ReceiveTimeoutException(
              408, ExceptionStrings.receiveTimeoutExceptionMessage);
        case DioExceptionType.badResponse:
          final errorMessage = error.response?.data['message'];
          switch (error.response?.statusCode) {
            case 401:
              final message = errorMessage ?? '${error.response?.data}';
              throw UnauthorisedException(error.response!.statusCode,
                  message ?? ExceptionStrings.unauthorisedExceptionMessage);
            case 404:
              throw NotFoundException(
                  404,
                  errorMessage ??
                      (error.response?.data?.toString() ??
                          ExceptionStrings.notFoundExceptionMessage));
            case 500:
              throw InternalServerException(
                  500, ExceptionStrings.internalServerExceptionMessage);
            default:
              throw DefaultException(001,
                  errorMessage ?? ExceptionStrings.defaultExceptionMessage);
          }
        case DioExceptionType.cancel:
          throw RequestCancelledException(
              002, ExceptionStrings.requestCancelledExceptionMessage);
        case DioExceptionType.connectionError:
          throw DefaultException(003, ExceptionStrings.defaultExceptionMessage);
        case DioExceptionType.unknown:
          throw DefaultException(004, ExceptionStrings.defaultExceptionMessage);
        case DioExceptionType.badCertificate:
          throw DefaultException(005, ExceptionStrings.defaultExceptionMessage);
      }
    } else {
      throw UnexpectedException(
          000, ExceptionStrings.unexpectedExceptionMessage);
    }
  }

  //set dio interceptors for logging and auth token refresh etc
  void _setDioInterceptorList(Api api) {
    List<Interceptor> interceptorList = [];

    _dio.interceptors.clear();
    //only add logging interceptor in debug mode
    if (kDebugMode) {
      interceptorList.add(PrettyDioLogger());
    }

    if (api == Api.protected) {
      // add your refresh token interceptor here
    }

    _dio.interceptors.addAll(interceptorList);
  }
}

abstract class ApiOptions {
  Options options = Options();
}

class PublicApiOptions extends ApiOptions {
  PublicApiOptions() {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
    };
  }
}

//add token for protected apis
class ProtectedApiOptions extends ApiOptions {
  ProtectedApiOptions(String apiToken) {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiToken',
    };
  }
}

enum Api { public, protected }
