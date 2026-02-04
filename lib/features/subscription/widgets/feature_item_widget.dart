import 'package:flutter/material.dart';

class FeatureItemWidget extends StatelessWidget {
  final String title;
  final String icon;

  const FeatureItemWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            icon,
            color: Colors.grey,
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }
}
