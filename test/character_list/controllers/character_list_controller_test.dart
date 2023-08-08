import 'package:anywhere_realestate_assignment/app/core/api/anywhere_api.dart';
import 'package:anywhere_realestate_assignment/app/core/api/custom_exception.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
// import 'package:anywhere_realestate_assignment/app/routes/pages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

class MockAnywhereApi extends Mock implements AnywhereApiImpl {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late CharacterListViewController controller;
  late AnywhereApi mockAnywhereApi;

  setUpAll(() {
    Get.testMode = true;
    controller = CharacterListViewController();
    mockAnywhereApi = MockAnywhereApi();
    controller.anywhereApi = mockAnywhereApi;
  });

  tearDown(() {
    controller.onClose();
    Get.reset();
  });

  group('CharacterListViewController:', () {
    test('getCharacters should call API and update state to success', () async {
      //setup mock response
      when(() => mockAnywhereApi.getCharacters())
          .thenAnswer((_) async => const Right(<RelatedTopic>[]));
      //call controller method
      await controller.getCharacters();
      //verify state is updated correctly
      expect(controller.pageState, PageState.success.obs);
      expect(controller.characters, []);
      //verify api is called once
      verify(() => mockAnywhereApi.getCharacters()).called(1);
    });

    test('getCharacters should call API and update state to error', () async {
      when(() => mockAnywhereApi.getCharacters()).thenAnswer((_) async => Left(
          InternalServerException(
              500, 'Something went wrong. Please try again.')));

      await controller.getCharacters();
      expect(controller.pageState, PageState.error.obs);
      expect(controller.characters, []);
      verify(() => mockAnywhereApi.getCharacters()).called(1);
    });

    test('getNameFromURL should return the name from url without underscore',
        () {
      const sampleUrl = 'https://duckduckgo.com/Roland_Pryzbylewski';
      final name = controller.getNameFromURL(sampleUrl);
      expect(name, 'Roland Pryzbylewski');
    });

    test(
        'getSelectedCharacterName should return character name from selectedCharacters firstUrl',
        () {
      const sampleCharacter =
          RelatedTopic(firstUrl: 'https://duckduckgo.com/Roland_Pryzbylewski');
      controller.selectedCharacter.value = sampleCharacter;

      final result = controller.getSelectedCharacterName();

      expect(result, "- Roland Pryzbylewski");
    });

    test('setCharacter should set the provided character as selectedCharacter',
        () {
      const sampleCharacter =
          RelatedTopic(firstUrl: 'https://duckduckgo.com/Stringer_Bell');

      controller.setCharacter(sampleCharacter);

      expect(controller.selectedCharacter.value, sampleCharacter);
    });
  });
}
