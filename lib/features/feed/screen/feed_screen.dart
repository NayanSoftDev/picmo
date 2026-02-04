import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';
import 'package:shak_bespoke/features/feed/controller/feed_controller.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full screen artwork
          Positioned.fill(
            child: Image.asset(
              Imagepath.loginImage,
              fit: BoxFit.cover,
            ),
          ),
          // Darken top and bottom for readability
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.black,
                  ],
                  stops: [0, 0.5, 1],
                ),
              ),
            ),
          ),
          // Top Navigation Bar + faux status icons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),

                      // ---------- Center Text ----------
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Viral Feed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      // ---------- Dummy right space ----------
                      const SizedBox(width: 40),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Bottom content + nav
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      Imagepath.loginImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Yuying Pan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'UID: 1244134',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Premium product promo video',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Upload your image to create an Alice counterattack story',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Row(
                              children: [
                                _InfoChip(label: '00:11'),
                                SizedBox(width: 8),
                                _InfoChip(label: 'Product Anima'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF00A8FF),
                                    Color(0xFFB700FF)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.snackbar('Template',
                                      'Template loaded successfully');
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.auto_fix_high,
                                        color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      'Use Template',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: controller.toggleLike,
                              child: Column(
                                children: [
                                  Icon(
                                    controller.isLiked.value
                                        ? Icons.thumb_up_off_alt
                                        : Icons.thumb_up_outlined,
                                    color: controller.isLiked.value
                                        ? Colors.red
                                        : Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    controller.likeCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          GestureDetector(
                            onTap: () => _showShareBottomSheet(context),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Make background transparent
      isScrollControlled: true, // Allows the bottom sheet to take full height
      builder: (BuildContext bc) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4, // Initial height of the bottom sheet
          minChildSize: 0.2, // Minimum height when dragged down
          maxChildSize: 0.9, // Maximum height when dragged up
          expand: false, // Set to false to allow custom initial size
          builder: (_, scrollController) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      Imagepath.backround3), // Using loginImage as background
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Share with friends',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  // Define the list of share options
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio:
                          0.8, // Adjust as needed for proper spacing
                    ),
                    itemCount:
                        8, // Total number of icons (2 vertically, 4 horizontally)
                    itemBuilder: (context, index) {
                      final List<Map<String, String>> shareOptions = [
                        {'label': 'Copy', 'icon': 'assets/icons/copyicon.png'},
                        {
                          'label': 'WhatsApp',
                          'icon': 'assets/icons/whatsapp.png'
                        },
                        {
                          'label': 'Facebook',
                          'icon': 'assets/icons/facebook.png'
                        },
                        {
                          'label': 'Messenger',
                          'icon': 'assets/icons/massenger.png'
                        },
                        {'label': 'Twitter', 'icon': 'assets/icons/twiter.png'},
                        {
                          'label': 'Instagram',
                          'icon': 'assets/icons/instagram.png'
                        },
                        {'label': 'Skype', 'icon': 'assets/icons/skype.png'},
                        {
                          'label': 'Message',
                          'icon': 'assets/icons/message.png'
                        },
                      ];
                      return _buildShareOption(
                        shareOptions[index]['label']!,
                        shareOptions[index]['icon']!,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Helper method to build individual share options
  Widget _buildShareOption(String label, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(),
            child: Image.asset(
              iconPath,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
