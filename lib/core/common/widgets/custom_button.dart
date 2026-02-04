import 'package:flutter/material.dart';
import 'package:shak_bespoke/core/common/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final Color? fontColor;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isEnabled = true,
    this.buttonColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: isEnabled ? 3 : 0,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: fontColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
