import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/subscription/controller/subscription_controller.dart';

class BillingSwitchWidget extends StatelessWidget {
  final SubscriptionController controller;

  const BillingSwitchWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Billing: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            'Monthly',
            style: TextStyle(
              fontSize: 12,
              fontWeight: !controller.isAnnualBilling
                  ? FontWeight.bold
                  : FontWeight.w500,
              color:
                  !controller.isAnnualBilling ? Colors.white70 : Colors.white70,
            ),
          ),
          Transform.scale(
            scale: 0.4,
            child: Switch(
              value: controller.isAnnualBilling,
              onChanged: (value) => controller.toggleBilling(),
              activeThumbColor: Colors.blue,
            ),
          ),
          Text(
            'Annually',
            style: TextStyle(
              fontSize: 12,
              fontWeight: controller.isAnnualBilling
                  ? FontWeight.bold
                  : FontWeight.w500,
              color:
                  controller.isAnnualBilling ? Colors.white70 : Colors.white70,
            ),
          ),
        ],
      );
    });
  }
}
