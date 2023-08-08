// Custom Exception Class to handle errors in a more readable and maintainable way
class CustomException implements Exception {
  CustomException(this._errorCode, this._message, this._prefix);

  final dynamic _message;
  final int _errorCode;
  final String _prefix;

  String get errorMessage => "$_message";

  int get errorCode => _errorCode;

  @override
  String toString() {
    return '$_errorCode: $_prefix: $_message';
  }
}

//create any custom exceptions here based error responses from the backend or known error codes
class RequestCancelledException extends CustomException {
  RequestCancelledException(errorCode, [message])
      : super(errorCode, message, 'Request Cancelled Exception');
}

class RequestTimeoutException extends CustomException {
  RequestTimeoutException(errorCode, [message])
      : super(errorCode, message, 'Request Timeout Exception');
}

class ReceiveTimeoutException extends CustomException {
  ReceiveTimeoutException(errorCode, [message])
      : super(errorCode, message, 'Receive Timeout Exception');
}

class DefaultException extends CustomException {
  DefaultException(errorCode, [message])
      : super(errorCode, message, 'Default Exception');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(errorCode, [message])
      : super(errorCode, message, 'Unauthorised');
}

class NotFoundException extends CustomException {
  NotFoundException(errorCode, [message])
      : super(errorCode, message, 'Not Found Expection');
}

class InternalServerException extends CustomException {
  InternalServerException(errorCode, [message])
      : super(errorCode, message, 'Internal Server Expection');
}

class UnexpectedException extends CustomException {
  UnexpectedException(errorCode, [message])
      : super(errorCode, message, 'Unexpected Error');
}

class NoDataException extends CustomException {
  NoDataException([message])
      : super(000, message, 'No Character Data Expection');
}
