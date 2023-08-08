import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/utils/responsive_layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterTile extends GetView<CharacterListViewController> {
  final RelatedTopic character;
  final bool fromSearch;
  const CharacterTile({
    super.key,
    required this.character,
    this.fromSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(controller.getNameFromURL(character.firstUrl!)),
      onTap: LayoutHelper(context).isMobile
          ? () => controller.toDetail(character)
          : () => controller.setCharacter(character, fromSearch: fromSearch),
    );
  }
}
