import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/routes/app_route.dart';
import '../controller/language_controller.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 🔥 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // your background image
              fit: BoxFit.cover,
            ),
          ),

          // Optional soft dark overlay for readability
          Container(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.4),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Choose language",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  const SizedBox(height: 14),

                  // 🔥 Language List
                  Expanded(
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(18),
                        // ignore: deprecated_member_use
                        border:
                            // ignore: deprecated_member_use
                            Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: ListView.separated(
                        itemCount: controller.languages.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.20),
                        ),
                        itemBuilder: (context, index) {
                          final lang = controller.languages[index];

                          return Obx(() {
                            bool isSelected =
                                controller.selectedLanguage.value ==
                                    lang["name"];

                            return InkWell(
                              onTap: () =>
                                  controller.selectLanguage(lang["name"]!),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lang["name"]!,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          lang["subtitle"]!,
                                          style: TextStyle(
                                            fontSize: 13,
                                            // ignore: deprecated_member_use
                                            color:
                                                // ignore: deprecated_member_use
                                                Colors.white.withOpacity(0.60),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (isSelected)
                                      const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 🔥 Save Button
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Saved",
                        "Language changed to ${controller.selectedLanguage.value}",
                        backgroundColor: Colors.black87,
                        colorText: Colors.white,
                      );
                      Get.toNamed(Approute.settingsScreen);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF5E00FF),
                            Color(0xFFBC00FF),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
