import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/views/character_list_view.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_content.dart';
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

  group('CharacterListBodyContent:', () {
    testWidgets('Renders CharacterListBodyContent Page without error',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const TestGetApp(CharacterListBodyContent()),
      );
      expect(find.byType(CharacterListBodyContent), findsOneWidget);
    });

    testWidgets('Renders loading indicator when PageState.loading',
        (WidgetTester tester) async {
      when(() => mockCharacterListController.pageState)
          .thenReturn(PageState.loading.obs);

      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders listview when PageState.success',
        (WidgetTester tester) async {
      when(() => mockCharacterListController.pageState)
          .thenReturn(PageState.success.obs);

      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Renders error message and retry button when PageState.error',
        (WidgetTester tester) async {
      when(() => mockCharacterListController.pageState)
          .thenReturn(PageState.error.obs);

      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(
          find.text('Something went wrong. Please try again.'), findsOneWidget);
      expect(find.byKey(const Key('retryButton')), findsOneWidget);
    });

    testWidgets('retry button calls getCharacters when pressed',
        (WidgetTester tester) async {
      when(() => mockCharacterListController.pageState)
          .thenReturn(PageState.error.obs);
      when(() => mockCharacterListController.getCharacters())
          .thenAnswer((_) async {});
      await tester.pumpWidget(
        const TestGetApp(CharacterListView()),
      );
      expect(find.byKey(const Key('retryButton')), findsOneWidget);
      var retryButton = find.byKey(const Key('retryButton'));
      await tester.tap(retryButton);
      verify(
        () => mockCharacterListController.getCharacters(),
      ).called(1);
    });
  });
}
