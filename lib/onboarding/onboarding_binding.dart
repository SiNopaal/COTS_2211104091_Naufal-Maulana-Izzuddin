import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    // Menghubungkan OnboardingController dengan OnboardingPage
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
