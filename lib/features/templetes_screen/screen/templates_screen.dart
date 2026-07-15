import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:shak_bespoke/features/home_screen/controller/homepage_controller.dart';
import 'package:shak_bespoke/features/home_screen/widgets/login_bottom_sheet.dart';
import 'package:shak_bespoke/features/templetes_screen/widgets/backround_image.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({super.key});

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomepageController>()) {
      Get.put(HomepageController());
    }

    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.black,
            onRefresh: _handleRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAll(
                              () => const BottomNavbarScreen(initialIndex: 0),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Templates",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Try Trending Templates",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.white70),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search templates",
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<HomepageController>(
                      builder: (controller) {
                        const double crossAxisSpacing = 16;
                        const double mainAxisSpacing = 16;
                        const double screenPadding = 20;
                        const double childAspectRatio = 0.8;

                        final double itemWidth = (screenSize.width -
                                (screenPadding * 2) -
                                crossAxisSpacing) /
                            2;
                        final double leftItemHeight =
                            itemWidth / childAspectRatio;
                        final double rightItemHeight = leftItemHeight * 1.15;

                        final List<Map<String, dynamic>> leftTemplates = [];
                        final List<Map<String, dynamic>> rightTemplates = [];

                        for (var i = 0;
                            i < controller.trendingTemplates.length;
                            i++) {
                          if (i.isEven) {
                            leftTemplates.add(controller.trendingTemplates[i]);
                          } else {
                            rightTemplates.add(controller.trendingTemplates[i]);
                          }
                        }

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  for (var i = 0;
                                      i < leftTemplates.length;
                                      i++) ...[
                                    SizedBox(
                                      height: leftItemHeight,
                                      child: _buildTemplateCard(
                                        leftTemplates[i],
                                        isSmallScreen,
                                      ),
                                    ),
                                    if (i < leftTemplates.length - 1)
                                      const SizedBox(height: mainAxisSpacing),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: crossAxisSpacing),
                            Expanded(
                              child: Column(
                                children: [
                                  for (var i = 0;
                                      i < rightTemplates.length;
                                      i++) ...[
                                    SizedBox(
                                      height: rightItemHeight,
                                      child: _buildTemplateCard(
                                        rightTemplates[i],
                                        isSmallScreen,
                                      ),
                                    ),
                                    if (i < rightTemplates.length - 1)
                                      const SizedBox(height: mainAxisSpacing),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(Map<String, dynamic> template, bool isSmallScreen) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(template['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(isSmallScreen ? 8 : 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.1),
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template['title'],
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    template['uses'],
                    style: TextStyle(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    const LoginBottomSheet(),
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Try this template',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
