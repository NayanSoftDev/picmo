import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/subscription/controller/subscription_controller.dart';
import 'billing_switch_widget.dart';

class PricingCardWidget extends StatelessWidget {
  final SubscriptionController controller;

  const PricingCardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF141517),
            Color(0xFF141517),
            Color(0xFF362D3E),
            Color(0xFF141517),
            Color(0xFF362D3E),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPricingSection(),
          const SizedBox(height: 16),
          Center(child: BillingSwitchWidget(controller: controller)),
        ],
      ),
    );
  }

  Widget _buildPricingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Text(
            controller.currentPrice,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          );
        }),
        const SizedBox(height: 4),
        Obx(() {
          return ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF00C7FF),
                Color(0xFFFFFFFF),
              ],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text:
                        'USD \$${controller.isAnnualBilling ? '50.00' : '9.00'} / ',
                  ),
                  TextSpan(
                    text: controller.billingFrequency,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
