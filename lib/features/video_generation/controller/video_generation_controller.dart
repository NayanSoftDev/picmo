import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';

class VideoGenerationController extends GetxController {
  /// Selected template index
  RxInt selectedTemplate = 0.obs;

  /// Template images list
  final templateImages = [
    Imagepath.template1,
    Imagepath.template2,
    Imagepath.template3,
    Imagepath.template4,
    Imagepath.template5,
  ];

  /// Text controller for Custom Prompt
  TextEditingController textController = TextEditingController();

  /// Word Counter (0–2000)
  RxInt wordCount = 0.obs;

  /// Prompt text (optional, if you need it later)
  RxString prompt = ''.obs;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
