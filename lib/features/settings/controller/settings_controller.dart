import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedIndex = (-1).obs;
  final settingsItems = [
    {
      "icon": "person",
      "title": "Account Setting",
      "route": "/accountDetailsScreen"
    },
    {"icon": "language", "title": "Language", "route": "/languageScreen"},
    {
      "icon": "email",
      "title": "E-mail Support",
    },
    {
      "icon": "info",
      "title": "About Picmo",
    },
    {"icon": "help", "title": "Feedback & Help", "route": "/contactScreen"},
  ];
}
