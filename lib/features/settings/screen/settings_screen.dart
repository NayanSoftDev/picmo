import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/settings/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent, // 🔥 FIXED
      extendBody: true, // 🔥 Important
      extendBodyBehindAppBar: true, // 🔥 Important

      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),

          // Black overlay
          // ignore: deprecated_member_use
          Container(color: Colors.black.withOpacity(0.4)),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 22),
                        onPressed: () => Get.back(),
                      ),
                      const Spacer(),
                      const Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                    child: Obx(
                      () => Column(
                        children: List.generate(
                          controller.settingsItems.length,
                          (index) {
                            final item = controller.settingsItems[index];
                            final isLast =
                                index == controller.settingsItems.length - 1;

                            return Column(
                              children: [
                                ListTile(
                                  leading: _buildIcon(item["icon"]!),
                                  title: Text(
                                    item["title"]!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  trailing:
                                      controller.selectedIndex.value == index
                                          ? const Icon(Icons.chevron_right,
                                              color: Colors.white70)
                                          : null,
                                  onTap: () {
                                    controller.selectedIndex.value = index;
                                    Get.toNamed(item["route"]!);
                                  },
                                ),
                                if (!isLast)
                                  Divider(
                                    height: 1,
                                    thickness: 0.4,
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String type) {
    switch (type) {
      case "person":
        return const Icon(Icons.person_outlined, color: Colors.white, size: 22);
      case "language":
        return const Icon(Icons.language_outlined,
            color: Colors.white, size: 22);
      case "email":
        return const Icon(Icons.email_outlined, color: Colors.white, size: 22);
      case "info":
        return const Icon(Icons.info_outline, color: Colors.white, size: 22);
      case "help":
        return const Icon(Icons.help_outline, color: Colors.white, size: 22);
      default:
        return const Icon(Icons.circle, color: Colors.white, size: 22);
    }
  }
}
