import 'package:get/get.dart';
import 'package:shak_bespoke/features/bottom_navbar/controller/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
  }
}
