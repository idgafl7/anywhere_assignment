import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_content.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_list_body_tablet.dart';
import 'package:anywhere_realestate_assignment/app/utils/character_search_delegate.dart';
import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';
import 'package:anywhere_realestate_assignment/app/utils/responsive_layout_helper.dart';
import 'package:anywhere_realestate_assignment/enviroment_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//main view for the character list page
class CharacterListView extends GetView<CharacterListViewController> {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
              "${EnvironmentConfig.isSimpsons ? UIStrings.simpsons : UIStrings.theWire} Characters ${LayoutHelper(context).isMobile ? "" : controller.getSelectedCharacterName()}")),
          actions: [
            Obx(
              () => IconButton(
                icon: const Icon(Icons.search),
                key: const Key('searchButton'),
                onPressed: controller.characters.isNotEmpty
                    ? () => showSearch(
                          context: context,
                          delegate:
                              CharacterSearchDelegate(controller.characters),
                        )
                    : null,
              ),
            )
          ],
        ),
        //show different body based on current app layout
        body: LayoutHelper(context).isMobile
            ? const CharacterListBodyContent()
            : const CharacterListBodyTablet(),
      ),
    );
  }
}
