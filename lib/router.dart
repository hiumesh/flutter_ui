import 'package:go_router/go_router.dart';

import './screens/home_navigation/home.dart';
import './screens/onboarding/onboarding_screen_one.dart';
import './screens/onboarding/onboarding_screen_two.dart';
import './screens/forms/form_screen_one.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/onboarding_one",
      builder: (context, state) => const OnboardingScreenOne(),
    ),
    GoRoute(
      path: "/onboarding_two",
      builder: (context, state) => const OnboardingScreenTwo(),
    ),
  ],
);
