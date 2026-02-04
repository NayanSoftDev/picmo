import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxString selectedLanguage = "English".obs;

  final List<Map<String, String>> languages = [
    {"name": "English", "subtitle": "English"},
    {"name": "한국인", "subtitle": "Korean"},
    {"name": "हिन्दी", "subtitle": "Hindi"},
    {"name": "Deutsch", "subtitle": "German"},
    {"name": "española", "subtitle": "Spanish"},
    {"name": "português", "subtitle": "Portuguese"},
    {"name": "日本語", "subtitle": "Japanese"},
    {"name": "français", "subtitle": "French"},
  ];

  void selectLanguage(String value) {
    selectedLanguage.value = value;
  }
}
