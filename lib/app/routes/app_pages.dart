import 'package:get/get.dart';

import '../modules/facture/bindings/facture_binding.dart';
import '../modules/facture/views/facture_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';
import '../modules/transfert/bindings/transfert_binding.dart';
import '../modules/transfert/views/transfert_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERT,
      page: () => const TransfertView(),
      binding: TransfertBinding(),
    ),
    GetPage(
      name: _Paths.FACTURE,
      page: () => const FactureView(),
      binding: FactureBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
  ];
}
