import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/views/character_list_view.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_content.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get/get.dart';

import '../helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockCharacterListController mockCharacterListController;

  setUpAll(() {
    Get.testMode = true;
    mockCharacterListController = MockCharacterListController();
    Get.put(mockCharacterListController as CharacterListViewController);
    when(() => mockCharacterListController.pageState)
        .thenReturn(PageState.init.obs);
    when(() => mockCharacterListController.characters)
        .thenAnswer((_) => <RelatedTopic>[].obs);
    when(
      () => mockCharacterListController.selectedCharacter,
    ).thenReturn(Rx<RelatedTopic?>(null));
  });

  group('CharacterListView:', () {
    testWidgets('Renders CharacterListView Page without error',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byType(CharacterListView), findsOneWidget);
    });

    testWidgets('Renders CharacterListBodyContent for mobile layout',
        (WidgetTester tester) async {
      tester.view.physicalSize = Size(414, 896);

      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byType(CharacterListBodyContent), findsOneWidget);
    });

    testWidgets(
        'Renders CharacterListBodyTablet for tablet layout & mobile landscape',
        (WidgetTester tester) async {
      tester.view.physicalSize = Size(896, 414);
      tester.view.devicePixelRatio = 3.0;

      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byType(CharacterListBodyTablet), findsOneWidget);
    });

    testWidgets(
        'Renders search icon as enabled when controller.characters.isNotEmpty',
        (WidgetTester tester) async {
      //we already set the state to nonNull list in the setup
      when(() => mockCharacterListController.characters)
          .thenAnswer((_) => [RelatedTopic()].obs);
      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byKey(const Key('searchButton')), findsOneWidget);
      var searchButton = find.byKey(const Key('searchButton'));
      final IconButton button = tester.widget(searchButton);
      expect(button.onPressed, isNotNull);
    });

    testWidgets(
        'Renders search icon as disabled when controller.characters.isEmpty',
        (WidgetTester tester) async {
      //we already set the state to nonNull list in the setup
      when(() => mockCharacterListController.characters)
          .thenAnswer((_) => <RelatedTopic>[].obs);
      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byKey(const Key('searchButton')), findsOneWidget);
      var searchButton = find.byKey(const Key('searchButton'));
      final IconButton button = tester.widget(searchButton);
      expect(button.onPressed, isNull);
    });
  });
}
