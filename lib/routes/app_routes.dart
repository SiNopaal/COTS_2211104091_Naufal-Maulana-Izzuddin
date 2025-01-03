import 'package:get/get.dart';

import '../login/view/login_page.dart';
import '../main/view/main_page.dart';
import '../onboarding/views/onboarding_page.dart';

class AppRoutes {
  static const ONBOARDING = '/';
  static const LOGIN = '/login';
  static const MAIN = '/main';

  static final routes = [
    GetPage(name: ONBOARDING, page: () => OnboardingPage()),
    GetPage(name: LOGIN, page: () => LoginPage()),
    GetPage(name: MAIN, page: () => MainPage()),
  ];
}
