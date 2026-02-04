import 'package:get/get.dart';
import 'package:shak_bespoke/features/subscription/model/subscription_model.dart';

class SubscriptionController extends GetxController {
  final Rx<SubscriptionPlan> _selectedPlan = SubscriptionPlan.monthly.obs;
  final RxBool _isAnnualBilling = false.obs;

  SubscriptionPlan get selectedPlan => _selectedPlan.value;
  bool get isAnnualBilling => _isAnnualBilling.value;

  List<SubscriptionFeature> get features => [
        const SubscriptionFeature(
          title: 'Unlimited usage of Picma IQ/2x',
          icon: 'assets/icons/cross.png',
        ),
        const SubscriptionFeature(
          title: '10 sec video generation',
          icon: 'assets/icons/cross.png',
        ),
        const SubscriptionFeature(
          title: '1080p video generation',
          icon: 'assets/icons/signS.png',
        ),
        const SubscriptionFeature(
            title: 'Watermarks removal', icon: 'assets/icons/signS.png'),
        const SubscriptionFeature(
          title: 'Maximum number of parallel tasks',
          icon: 'assets/icons/one.png',
        ),
        const SubscriptionFeature(
            title: 'Cancel anytime', icon: 'assets/icons/signS.png'),
      ];

  String get currentPrice {
    return isAnnualBilling ? 'USD \$50.00' : 'USD \$60.00';
  }

  String get billingFrequency {
    return isAnnualBilling ? 'per year' : 'per month';
  }

  String get buttonPrice {
    return isAnnualBilling ? 'USD \$50.00' : 'USD \$9.00';
  }

  void toggleBilling() {
    _isAnnualBilling.toggle();
    _selectedPlan.value =
        isAnnualBilling ? SubscriptionPlan.annually : SubscriptionPlan.monthly;
  }

  void subscribe() {
    // Handle subscription logic here
    Get.snackbar(
      'Subscription',
      'Subscribed to ${isAnnualBilling ? 'Annual' : 'Monthly'} plan',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
