import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_detail_view_content.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListBodyTablet extends GetView<CharacterListViewController> {
  const CharacterListBodyTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const CharacterListBodyContent()),
      Obx(
        () => Expanded(
            child: DetailViewContent(
                character: controller.selectedCharacter.value)),
      ),
    ]);
  }
}
