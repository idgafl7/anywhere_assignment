import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_tile.dart';
import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListBodyContent extends GetView<CharacterListViewController> {
  const CharacterListBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.pageState.value) {
        case PageState.loading:
          return const Center(child: CircularProgressIndicator());
        case PageState.success:
          return ListView.builder(
            itemCount: controller.characters.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterTile(character: controller.characters[index]);
            },
          );
        case PageState.error:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(ExceptionStrings.defaultExceptionMessage),
                ElevatedButton(
                    key: const Key('retryButton'),
                    onPressed: () => controller.getCharacters(),
                    child: const Text(UIStrings.retry))
              ],
            ),
          );
        default:
          return const Center(
              child: Text(ExceptionStrings.noCharacterDataExceptionMessage));
      }
    });
  }
}
