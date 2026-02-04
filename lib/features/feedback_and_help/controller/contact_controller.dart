import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ContactController extends GetxController {
  final messageController = TextEditingController();
  final contactController = TextEditingController();

  final RxInt _characterCount = 0.obs;
  final RxBool _isSubmitting = false.obs;
  final RxList<bool> _checkboxes = RxList<bool>.filled(4, false);

  int get characterCount => _characterCount.value;
  bool get isSubmitting => _isSubmitting.value;
  List<bool> get checkboxes => _checkboxes;
  bool get isMessageValid => characterCount <= 2000;

  @override
  void onInit() {
    messageController.addListener(updateCharacterCount);
    super.onInit();
  }

  @override
  void onClose() {
    messageController.removeListener(updateCharacterCount);
    messageController.dispose();
    contactController.dispose();
    super.onClose();
  }

  void toggleCheckbox(int index, bool? value) {
    if (value != null) {
      _checkboxes[index] = value;
    }
  }

  void updateCharacterCount() {
    _characterCount.value = messageController.text.length;
  }

  Future<void> submitForm() async {
    if (!isMessageValid) {
      Get.snackbar(
        'Error',
        'Message exceeds character limit',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    _isSubmitting.value = true;


    await Future.delayed(const Duration(seconds: 2));

    _isSubmitting.value = false;

    Get.snackbar(
      'Success',
      'Your message has been submitted!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

  
    messageController.clear();
    contactController.clear();
    _characterCount.value = 0;
  }
}
