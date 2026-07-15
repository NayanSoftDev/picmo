import 'package:get/get_navigation/get_navigation.dart';
import 'package:shak_bespoke/features/account_settings/screens/account_details_screen.dart';
import 'package:shak_bespoke/features/after_login/screen/after_login_screen.dart';
import 'package:shak_bespoke/features/bottom_navbar/bindings/bottom_navbar_binding.dart';
import 'package:shak_bespoke/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:shak_bespoke/features/feedback_and_help/screen/contact_screen.dart';
import 'package:shak_bespoke/features/feed/screen/feed_screen.dart';
import 'package:shak_bespoke/features/home_screen/screen/homepage_screen.dart';
import 'package:shak_bespoke/features/language/screen/language_screen.dart';
import 'package:shak_bespoke/features/settings/screen/settings_screen.dart';
import 'package:shak_bespoke/features/splash/screen/splash_screen.dart';
import 'package:shak_bespoke/features/templetes_screen/screen/templates_screen.dart';
import 'package:shak_bespoke/features/video_screen/screens/video_screen.dart';
import 'package:shak_bespoke/features/video_generation/binding/video_generation_binding.dart';
import 'package:shak_bespoke/features/video_generation/screen/video_generation_screen.dart';
import 'package:shak_bespoke/features/about/screen/about_screen.dart';
import 'package:shak_bespoke/features/profile/screens/profile_screen.dart';
import 'package:shak_bespoke/features/subscription/screen/subscription_screen.dart';

class Approute {
  static String splashScreen = '/splashScreen';
  static String subscriptionScreen = '/subscriptionScreen';
  static String contactScreen = '/contactScreen';
  static String feedScreen = '/feedScreen';
  static String homepageScreen = '/homepageScreen';
  static String afterLoginScreen = '/afterLoginScreen';

  static String accountDetailsScreen = '/accountDetailsScreen';
  static String languageScreen = '/languageScreen';
  static String aboutScreen = '/aboutScreen';
  static String profileScreen = '/profileScreen';
  static String templetesScreen = '/templatesScreen';
  static String videoScreen = '/videoScreen';
  static String bottomNavbarScreen = '/bottomNavbarScreen';
  static String settingsScreen = '/settingsScreen';
  static String videoGenerationScreen = '/videoGenerationScreen';

  static String getSplashScreen() => splashScreen;
  static String getContactScreen() => contactScreen;
  static String getAccountDetailsScreen() => accountDetailsScreen;
  static String getFeedScreen() => feedScreen;
  static String getAboutScreen() => aboutScreen;

  static String getSubscriptionScreen() => subscriptionScreen;
  static String getLanguageScreen() => languageScreen;
  static String getProfileScreen() => profileScreen;
  static String getVideoScreen() => videoScreen;
  static String getHomepageScreen() => homepageScreen;
  static String getAfterLoginScreen() => afterLoginScreen;

  static String getBottomNavbarScreen() => bottomNavbarScreen;
  static String getSettingsScreen() => settingsScreen;
  static String getVideoGenerationScreen() => videoGenerationScreen;

  static List<GetPage> routes = [
    // GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: contactScreen, page: () => const ContactScreen()),
    GetPage(name: subscriptionScreen, page: () => const SubscriptionScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: feedScreen, page: () => const FeedScreen()),
    GetPage(
        name: accountDetailsScreen, page: () => const AccountDetailsScreen()),
    GetPage(name: languageScreen, page: () => const LanguageScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: aboutScreen, page: () => const AboutScreen()),

    GetPage(name: templetesScreen, page: () => TemplatesScreen()),
    GetPage(name: videoScreen, page: () => const VideoScreen()),
    GetPage(
        name: bottomNavbarScreen,
        page: () => const BottomNavbarScreen(),
        binding: BottomNavbarBinding()),
    GetPage(name: settingsScreen, page: () => const SettingsScreen()),
    GetPage(
      name: videoGenerationScreen,
      page: () => const VideoGenerationScreen(),
      binding: VideoGenerationBinding(),
    ),
    GetPage(name: homepageScreen, page: () => HomepageScreen()),
    GetPage(name: afterLoginScreen, page: () => AfterLoginScreen()),
  ];
}
