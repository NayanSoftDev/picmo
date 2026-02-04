import 'package:get/get.dart';

class HomepageController extends GetxController {
  // Background image path
  static const String backGroundImage = 'assets/images/background.png';

  // Trending templates data
  final List<Map<String, dynamic>> trendingTemplates = [
    {
      'title': 'Anime Blast',
      'uses': '2542 uses',
      'category': 'Cartoon 2.0',
      'image': 'assets/images/Img1.png',
    },
    {
      'title': 'Cyberpunk',
      'uses': '1895 uses',
      'category': 'Sci-Fi',
      'image': 'assets/images/Img2.png',
    },
    {
      'title': 'Nature',
      'uses': '3104 uses',
      'category': 'Realism',
      'image': 'assets/images/Img3.png',
    },
    {
      'title': 'Abstract',
      'uses': '1578 uses',
      'category': 'Art',
      'image': 'assets/images/Img4.png',
    },
  ];

  // Upload options
  final List<Map<String, dynamic>> uploadOptions = [
    {
      'title': 'Take Photo',
      'isSelected': false,
      'icon': 'assets/icons/cameraIcon.png',
    },
    {
      'title': 'Gallery',
      'isSelected': true,
      'icon': 'assets/icons/galleryIcon.png',
    },
  ];

  void toggleUploadOption(int index) {
    for (int i = 0; i < uploadOptions.length; i++) {
      uploadOptions[i]['isSelected'] = i == index;
    }
    update();
  }
}
