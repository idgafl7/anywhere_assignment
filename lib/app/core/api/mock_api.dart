import 'package:anywhere_realestate_assignment/app/core/api/anywhere_api.dart';
import 'package:anywhere_realestate_assignment/app/core/api/custom_exception.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:dartz/dartz.dart';

//mock api implementation
class MockAnywhereApi extends AnywhereApi {
  @override
  Future<Either<CustomException, List<RelatedTopic>>> getCharacters() {
    return Future.delayed(
      const Duration(milliseconds: 500),
      //add mock data for testing purposes
      () => Right(List<RelatedTopic>.empty()),
    );
  }
}
