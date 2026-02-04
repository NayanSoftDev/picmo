import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';
import 'package:shak_bespoke/features/onboarding/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds then go to Onboarding Screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              Imagepath.backGroundimage,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
          ),

          /// Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/splash_icon.png", width: 185),
                const SizedBox(height: 10),
                Image.asset("assets/icons/splash_logo.png", width: 195),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
