import 'package:anywhere_realestate_assignment/app/features/character_list/bindings/character_list_view_binding.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/views/character_detail_view.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/views/character_list_view.dart';
import 'package:anywhere_realestate_assignment/app/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.characterList,
      page: () => const CharacterListView(),
      binding: CharacterListViewBinding(),
    ),
    GetPage(
      name: Routes.characterDetail,
      page: () => const CharacterDetailView(),
      binding: CharacterListViewBinding(),
    ),
  ];
}
