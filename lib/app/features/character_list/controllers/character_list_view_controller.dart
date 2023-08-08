import 'package:anywhere_realestate_assignment/app/core/api/anywhere_api.dart';
import 'package:anywhere_realestate_assignment/app/core/api/anywhere_data.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/routes/routes.dart';

import 'package:get/get.dart';

enum PageState { init, loading, success, error }

//controller for all logic related to the character list view and detail page
class CharacterListViewController extends GetxController {
  AnywhereApi anywhereApi = AnywhereDataImpl.instance.anywhereApi;

  Rx<RelatedTopic?> selectedCharacter = Rx<RelatedTopic?>(null);

  final RxList<RelatedTopic> _characters = <RelatedTopic>[].obs;
  List<RelatedTopic> get characters => _characters;

  final Rx<PageState> pageState = PageState.init.obs;

  //call api to get characters and update state
  Future<void> getCharacters() async {
    pageState.value = PageState.loading;
    final response = await anywhereApi.getCharacters();
    response.fold((l) {
      pageState.value = PageState.error;
    }, (r) {
      _characters.value = r;
      pageState.value = PageState.success;
    });
  }

  //get character name from url since our JSON response does not have a name field
  String getNameFromURL(String url) {
    return Uri.decodeFull(url)
        .replaceAll("https://duckduckgo.com/", "")
        .replaceAll("_", " ");
  }

  //get character name to display in app bar for tablet view & mobile landscape view
  String getSelectedCharacterName() {
    return selectedCharacter.value != null
        ? "- ${getNameFromURL(selectedCharacter.value!.firstUrl!)}"
        : "";
  }

  //set selected character and close search if called from search
  void setCharacter(RelatedTopic character, {bool fromSearch = false}) {
    selectedCharacter.value = character;
    if (fromSearch) Get.back();
  }

  void toDetail(RelatedTopic character) {
    Get.toNamed(Routes.characterDetail, arguments: character);
  }

  @override
  void onInit() {
    getCharacters();
    super.onInit();
  }
}
