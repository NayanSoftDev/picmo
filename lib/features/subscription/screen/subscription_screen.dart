import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/core/common/constants/imagepath.dart';
import 'package:shak_bespoke/features/subscription/controller/subscription_controller.dart';
import '../widgets/feature_item_widget.dart';
import '../widgets/pricing_card_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionController controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            Imagepath.backGroundimage,
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 29, 35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Upgrade to Premium',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PricingCardWidget(controller: controller),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.verified_user_outlined, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'Membership Benefits',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    for (var i = 0; i < controller.features.length; i++) ...[
                      FeatureItemWidget(
                        title: controller.features[i].title,
                        icon: controller.features[i].icon,
                      ),
                      if (i < controller.features.length - 1)
                        const Divider(
                          color: Color.fromARGB(255, 28, 27, 27),
                          height: 8,
                        ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildSubscribeButton(),
              ),
              const SizedBox(height: 16),
              _buildTermsLinks(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(0, 198, 255, 1),
            Color.fromRGBO(85, 43, 255, 1),
            Color.fromRGBO(208, 0, 255, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Obx(() {
        return ElevatedButton(
          onPressed: controller.subscribe,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            'Subscribe for ${controller.buttonPrice}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        );
      }),
    );
  }

  Widget _buildTermsLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Terms of Service',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text('|', style: TextStyle(fontSize: 12, color: Colors.grey)),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
