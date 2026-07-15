import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:shak_bespoke/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile_header.dart';
import '../widgets/gallery_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  if (Get.isRegistered<BottomNavbarController>()) {
                    Get.find<BottomNavbarController>().changeIndex(3);
                  } else {
                    Get.offAll(
                      () => const BottomNavbarScreen(initialIndex: 3),
                    );
                  }
                },
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ],
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(),
                  SizedBox(height: 16),
                  GallerySection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
