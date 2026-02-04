import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';
import 'package:shak_bespoke/features/video_screen/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoController());
    final size = Get.size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            Imagepath.backGroundimage,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: size.height * 0.50,
                  width: double.infinity,
                  child: Obx(() {
                    if (!controller.isVideoInitialized.value) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: controller
                                .videoPlayerController.value.aspectRatio,
                            child:
                                VideoPlayer(controller.videoPlayerController),
                          ),
                          Positioned(
                            top: 60,
                            left: 0,
                            child: Text(
                              "Preview Result",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.055,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.skip_previous,
                                    color: Colors.white, size: 30),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: controller.playPause,
                                child: Obx(() => Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: controller.isPlaying.value
                                            ? null
                                            : const LinearGradient(
                                                colors: [
                                                  Colors.blueAccent,
                                                  Colors.purpleAccent
                                                ],
                                              ),
                                        color: controller.isPlaying.value
                                            // ignore: deprecated_member_use
                                            ? Colors.black.withOpacity(0.5)
                                            : null,
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Icon(
                                        controller.isPlaying.value
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.skip_next,
                                    color: Colors.white, size: 30),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 25,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 58, 31, 139)
                                    // ignore: deprecated_member_use
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/videoicon1.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Templates',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/videoicon3.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Caption',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/videoicon4.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Cover',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 80,
                            left: 0,
                            right: 0,
                            child: Row(
                              children: [
                                const Text("Duration: 02s",
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      // ignore: deprecated_member_use
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    child: FractionallySizedBox(
                                      widthFactor: 1 / 3,
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Colors.purpleAccent,
                                              Colors.blueAccent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text("06s",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),

                const Text(
                  "Video Title",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color:
                        // ignore: deprecated_member_use
                        const Color.fromARGB(255, 58, 31, 139).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Untitled...",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// BOTTOM ICONS + SHARE BUTTON
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(3, (index) {
                          final icons = [
                            'assets/icons/videoicon1.png',
                            'assets/icons/videoicon3.png',
                            'assets/icons/videoicon4.png',
                          ];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // ignore: deprecated_member_use
                              color: const Color.fromARGB(255, 129, 129, 129)
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.2),
                              image: DecorationImage(
                                image: AssetImage(icons[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.purpleAccent],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/videoicon5.png',
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Share to Feed",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomIcon(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Image.asset(path),
      ),
    );
  }
}
