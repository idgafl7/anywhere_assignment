import 'package:anywhere_realestate_assignment/app/core/api/api_endpoints.dart';
import 'package:anywhere_realestate_assignment/app/core/api/custom_exception.dart';
import 'package:anywhere_realestate_assignment/app/core/api/rest_client.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/characters_response.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';
import 'package:anywhere_realestate_assignment/enviroment_config.dart';
import 'package:dartz/dartz.dart';

//abstract class to allow for mocking apis
abstract class AnywhereApi {
  Future<Either<CustomException, List<RelatedTopic>>> getCharacters();
}

//real implementation
class AnywhereApiImpl extends AnywhereApi {
  AnywhereApiImpl({
    required this.client,
  });

  final AnywhereRestClient client;

  @override
  Future<Either<CustomException, List<RelatedTopic>>> getCharacters() async {
    //apply query params based on app flavor
    final queryParams = {
      'q': EnvironmentConfig.isSimpsons
          ? QueryStrings.simpsonsQuery
          : QueryStrings.theWireQuery,
      'format': 'json'
    };
    try {
      final res = await client.get(Api.public, ApiEndPoints.characters,
          queryParameters: queryParams);
      final CharactersResponse charactersResponse =
          CharactersResponse.fromJson(res.data);
      if (charactersResponse.relatedTopics != null) {
        return Right(charactersResponse.relatedTopics!);
      } else {
        return Left(
            NoDataException(ExceptionStrings.noCharacterDataExceptionMessage));
      }
    } on CustomException catch (e) {
      return Left(e);
    } catch (_) {
      return Left(
          DefaultException(000, ExceptionStrings.defaultExceptionMessage));
    }
  }
}
