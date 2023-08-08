import 'package:anywhere_realestate_assignment/app/features/character_list/controllers/character_list_view_controller.dart';
import 'package:get/get.dart';

//bind controller to view by adding these bindings in the page bindings in pages.dart
class CharacterListViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterListViewController>(
        () => CharacterListViewController());
  }
}
