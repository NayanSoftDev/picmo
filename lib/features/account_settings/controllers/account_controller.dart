import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/account_model.dart';

class AccountController extends GetxController {
  final Rx<AccountModel> _account = AccountModel.empty().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isDeleting = false.obs;

  AccountModel get account => _account.value;
  bool get isLoading => _isLoading.value;
  bool get isDeleting => _isDeleting.value;

  @override
  void onInit() {
    _loadAccountData();
    super.onInit();
  }

  Future<void> _loadAccountData() async {
    _isLoading.value = true;

    // Simulate API call to fetch account data
    await Future.delayed(const Duration(seconds: 1));

    _account.value = AccountModel(
      name: 'Alex Farguson',
      title: 'Singer',
      account: 'alex@gmail.com',
      picmoId: '55544545551145415',
    );

    _isLoading.value = false;
  }

  Future<void> deleteAccount() async {
    // Show confirmation dialog
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (result == true) {
      _isDeleting.value = true;

      // Simulate API call for account deletion
      await Future.delayed(const Duration(seconds: 2));

      _isDeleting.value = false;

      Get.offAllNamed('/login'); 
      Get.snackbar(
        'Account Deleted',
        'Your account has been successfully deleted.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void updateAccount(AccountModel updatedAccount) {
    _account.value = updatedAccount;
  }
}
