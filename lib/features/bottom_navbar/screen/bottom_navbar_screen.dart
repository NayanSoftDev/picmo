import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/iconpath.dart';
import 'package:shak_bespoke/features/bottom_navbar/controller/bottom_navbar_controller.dart';

class BottomNavbarScreen extends StatelessWidget {
  final int initialIndex;
  final bool showAfterLoginScreen;

  const BottomNavbarScreen({
    super.key,
    this.initialIndex = 0,
    this.showAfterLoginScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    // Use Get.find to get controller instance
    final BottomNavbarController controller =
        Get.find<BottomNavbarController>();

    // Set initialIndex and showAfterLoginScreen flag once, safely
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.changeIndex(initialIndex);
      controller.setShowAfterLoginScreen(showAfterLoginScreen);
    });

    final activeIcons = [
      Iconpath.activeHome,
      Iconpath.activeTemplate,
      Iconpath.videoTab,
      Iconpath.activeSubscribe,
      Iconpath.activeProfile,
    ];

    final inactiveIcons = [
      Iconpath.inactiveHome,
      Iconpath.inactiveTemplate,
      Iconpath.videoTab,
      Iconpath.inactiveSubscribe,
      Iconpath.inactiveProfile,
    ];

    final labels = ['Home', 'Template', '', 'Subscribe', 'Profile'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          height: 97,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 14, 40, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                final isSelected = controller.selectedIndex.value == index;
                final double iconSize = index == 2 ? 50 : 24;
                return GestureDetector(
                  onTap: () => controller.changeIndex(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        isSelected ? activeIcons[index] : inactiveIcons[index],
                        width: iconSize,
                        height: iconSize,
                      ),
                      const SizedBox(height: 4),
                      if (labels[index].isNotEmpty)
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight:
                                isSelected ? FontWeight.w500 : FontWeight.w700,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
