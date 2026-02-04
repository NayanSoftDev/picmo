import 'package:flutter/material.dart';
import 'package:shak_bespoke/core/common/constants/app_colors.dart';

class CustomPasswordField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback? toggleObscure; // Optional callback for icon tap

  const CustomPasswordField({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.controller,
    required this.obscure,
    this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 15,
              ),
              suffixIcon: toggleObscure != null
                  ? IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: toggleObscure,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
