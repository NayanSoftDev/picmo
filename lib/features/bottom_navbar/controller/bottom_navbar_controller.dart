import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:shak_bespoke/features/after_login/screen/after_login_screen.dart';
import 'package:shak_bespoke/features/feed/screen/feed_screen.dart';
import 'package:shak_bespoke/features/home_screen/screen/homepage_screen.dart';
import 'package:shak_bespoke/features/templetes_screen/screen/templates_screen.dart';
import 'package:shak_bespoke/features/profile/screens/profile_screen.dart';
import 'package:shak_bespoke/features/subscription/screen/subscription_screen.dart';

class BottomNavbarController extends GetxController {
  var selectedIndex = 0.obs;

  // Add reactive flag to control if AfterLoginScreen is shown
  var showAfterLoginScreen = false.obs;

  // Reactive list of screens that rebuilds automatically when showAfterLoginScreen changes
  RxList<Widget> get screens => RxList([
        showAfterLoginScreen.value ? AfterLoginScreen() : HomepageScreen(),
        TemplatesScreen(),
        const FeedScreen(),
        const SubscriptionScreen(),
        const ProfileScreen(),
      ]);

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // Method to update the flag
  void setShowAfterLoginScreen(bool value) {
    showAfterLoginScreen.value = value;
    if (value) {
      selectedIndex.value = 0; // make sure first tab is selected
    }
  }
}
