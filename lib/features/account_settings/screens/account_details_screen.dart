import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/account_controller.dart';
import '../widgets/account_info_card.dart';
import '../widgets/delete_account_button.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountController());
    return Scaffold(
    backgroundColor: const Color.fromARGB(198, 16, 11, 42),
    appBar: AppBar(
      title: const Text('Account Settings'),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    body: Obx(
      () {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            color: Colors.grey.shade800,
                            size: 30,
                          )
                        : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AccountInfoCard(account: controller.account),
                    const SizedBox(height: 16),
                    DeleteAccountButton(
                      onDelete: controller.deleteAccount,
                      isLoading: controller.isDeleting,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
        );
  }
}
