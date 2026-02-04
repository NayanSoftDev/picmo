import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:shak_bespoke/core/common/constants/app_colors.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';

class CustomAuthAppbar extends StatelessWidget {
  final String title;
  const CustomAuthAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 267,
          child: Image.asset(
            Imagepath.appBarBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 90),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
