import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';

import '../controller/video_generation_controller.dart';

class VideoGenerationScreen extends StatelessWidget {
  final String? imagePath;
  const VideoGenerationScreen({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<VideoGenerationController>()
        ? Get.find<VideoGenerationController>()
        : Get.put(VideoGenerationController());

    final size = Get.size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// Background Image
          Image.asset(
            Imagepath.backGroundimage,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),

          /// MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Back & Credit Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.flash_on,
                                color: Colors.purpleAccent, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "Free Credit: 5/5",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  // / Selected Template Preview Box
                  Builder(builder: (context) {
                    Widget previewBox;
                    if (imagePath != null) {
                      previewBox = Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: FileImage(File(imagePath!)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      previewBox = Obx(() {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                controller.templateImages[
                                    controller.selectedTemplate.value],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                    }
                    return previewBox;
                  }),

                  const SizedBox(height: 12),

                  /// Info chips
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoChip("1080 x 1080"),
                      _infoChip("Duration: 06s"),
                      _infoChip("Picmo 2.3"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Template selection
                  const Text(
                    "Select Template",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 75,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.templateImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, index) {
                        return Obx(() {
                          final isSelected =
                              controller.selectedTemplate.value == index;
                          return GestureDetector(
                            onTap: () =>
                                controller.selectedTemplate.value = index,
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.purpleAccent
                                      : Colors.transparent,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      controller.templateImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Custom Prompt
                  const Text(
                    "Custom Prompt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText:
                            "Unleash your creativity! Share your story here",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                      onChanged: (val) => controller.prompt.value = val,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Generate Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showGeneratingVideoDialog(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Generate Video",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showGeneratingVideoDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            Imagepath.popup,
            fit: BoxFit.cover,
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  /// Info Chip widget
  Widget _infoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
