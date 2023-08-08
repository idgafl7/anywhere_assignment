import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_image.dart';
import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class DetailViewContent extends StatelessWidget {
  const DetailViewContent({
    super.key,
    required this.character,
  });

  final RelatedTopic? character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: character != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  CharacterImage(url: character!.icon?.url),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(character!.text ?? UIStrings.noDescription),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(UIStrings.selectACharacter),
            ),
    );
  }
}
