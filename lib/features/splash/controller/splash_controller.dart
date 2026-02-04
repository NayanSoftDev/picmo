import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goNext();
  }

  void _goNext() async {
    await Future.delayed(const Duration(seconds: 3));
    //Get.offAllNamed(Approute.getOnboardingScreen());
  }
}
