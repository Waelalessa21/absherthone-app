import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/features/login/ui/login_screen.dart';
import 'package:absherthone/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:absherthone/features/record/ui/record_screen.dart';
import 'package:absherthone/features/report/ui/report_screen.dart';
import 'package:absherthone/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';

///Class to handle routing in the app; it uses route name and build the screen when called.
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.record:
        return MaterialPageRoute(
          builder: (_) => const RecordScreen(),
        );

      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      case Routes.reports:
        return MaterialPageRoute(
          builder: (_) => const ReportScreen(),
        );
      default:
        return null;
    }
  }
}
