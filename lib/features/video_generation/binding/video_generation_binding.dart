import 'package:get/get.dart';
import 'package:shak_bespoke/features/video_generation/controller/video_generation_controller.dart';

class VideoGenerationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoGenerationController());
  }
}
