import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_detail_view_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailView extends GetView<CharacterListViewController> {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final RelatedTopic character = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.getNameFromURL(character.firstUrl!)),
      ),
      body: DetailViewContent(character: character),
    );
  }
}
