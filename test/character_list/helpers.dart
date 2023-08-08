import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TestGetApp extends StatelessWidget {
  final Widget view;
  const TestGetApp(
    this.view, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          const Breakpoint(start: 601, end: double.infinity, name: TABLET),
        ],
      ),
      home: view,
    );
  }
}

class MockCharacterListController extends GetxController
    with Mock
    implements CharacterListViewController {
  @override
  String getSelectedCharacterName() {
    return selectedCharacter.value != null
        ? "- ${getNameFromURL(selectedCharacter.value!.firstUrl!)}"
        : "";
  }
}
