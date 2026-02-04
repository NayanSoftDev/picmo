import 'package:shak_bespoke/features/home_screen/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepage_controller.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});

  final HomepageController controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(HomepageController.backGroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 20.0 : 40.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: isSmallScreen ? 10 : 40),
                  _buildGenerateVideoSection(isSmallScreen),
                  SizedBox(height: isSmallScreen ? 10 : 40),
                  _buildTrendingTemplatesSection(isSmallScreen, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/Maskicon.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              'Picmo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(const LoginBottomSheet(), isScrollControlled: true);
          },
          child: Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white12),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGenerateVideoSection(bool isSmallScreen) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 20 : 24),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        //color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        // ignore: deprecated_member_use
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Generate Video',
            style: TextStyle(
              fontSize: isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00C6FF),
                    Color(0xFF552BFF),
                    Color(0xFFCA00FC),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/upload.png',
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Upload Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          GetBuilder<HomepageController>(
            builder: (controller) => Row(
              children: List.generate(
                controller.uploadOptions.length,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index == 0 ? 8 : 0),
                    child: _buildUploadOption(
                      controller.uploadOptions[index]['title'],
                      controller.uploadOptions[index]['isSelected'],
                      index,
                      controller.uploadOptions[index]['icon'],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadOption(
      String title, bool isSelected, int index, String icon) {
    return GestureDetector(
      onTap: () => controller.toggleUploadOption(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected
                  // ignore: deprecated_member_use
                  ? Colors.white.withOpacity(0.1)
                  // ignore: deprecated_member_use
                  : const Color.fromARGB(0, 113, 114, 114)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 14,
              width: 14,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingTemplatesSection(
      bool isSmallScreen, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '🔥Trending Templates',
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Templates Grid
        GetBuilder<HomepageController>(
          builder: (controller) {
            final Size screenSize = MediaQuery.of(context).size;
            const double crossAxisSpacing = 16;
            const double mainAxisSpacing = 16;
            final double screenPadding = isSmallScreen ? 20.0 : 40.0;
            const double childAspectRatio = 0.8;

            final double itemWidth =
                (screenSize.width - (screenPadding * 2) - crossAxisSpacing) / 2;
            final double leftItemHeight = itemWidth / childAspectRatio;
            final double rightItemHeight = leftItemHeight * 1.15; // 15% taller

            List<Map<String, dynamic>> leftTemplates = [];
            List<Map<String, dynamic>> rightTemplates = [];

            for (var i = 0; i < controller.trendingTemplates.length; i++) {
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
                      for (var i = 0; i < leftTemplates.length; i++) ...[
                        SizedBox(
                          height: leftItemHeight,
                          child: _buildTemplateCard(
                              leftTemplates[i], isSmallScreen),
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
                      for (var i = 0; i < rightTemplates.length; i++) ...[
                        SizedBox(
                          height: rightItemHeight,
                          child: _buildTemplateCard(
                              rightTemplates[i], isSmallScreen),
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
      ],
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
                  SizedBox(height: isSmallScreen ? 4 : 8),
                ],
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
