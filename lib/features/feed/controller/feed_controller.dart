import 'package:get/get.dart';

class FeedController extends GetxController {
  final RxInt likeCount = 334.obs;
  final RxBool isLiked = false.obs;

  void toggleLike() {
    if (isLiked.value) {
      likeCount.value--;
    } else {
      likeCount.value++;
    }
    isLiked.toggle();
  }

  void shareContent() {
    // Implement share functionality
    Get.snackbar('Share', 'Content shared successfully');
  }
}
