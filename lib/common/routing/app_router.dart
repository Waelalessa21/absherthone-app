import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/features/login/ui/login_screen.dart';
import 'package:absherthone/features/login/ui/otp_screen.dart';
import 'package:absherthone/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:absherthone/features/record/ui/record_screen.dart';
import 'package:absherthone/features/report/ui/report_screen.dart';
import 'package:absherthone/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Class to handle routing in the app; it uses route name and build the screen when called.
class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      // Get arguments if any
      final args = settings.arguments;

      switch (settings.name) {
        case Routes.onBoarding:
          return MaterialPageRoute(
            builder: (context) {
              // If user is already authenticated, redirect to record screen
              if (Provider.of<AuthProvider>(context, listen: false)
                  .isAuthenticated) {
                return const RecordScreen();
              }
              return const OnBoardingScreen();
            },
          );

        case Routes.login:
          return MaterialPageRoute(
            builder: (context) {
              // If user is already authenticated, redirect to record screen
              if (Provider.of<AuthProvider>(context, listen: false)
                  .isAuthenticated) {
                return const RecordScreen();
              }
              return const LoginScreen();
            },
          );

        case Routes.otp:
          // Make sure we have the required arguments
          if (args is Map<String, String> &&
              args.containsKey('phoneNumber') &&
              args.containsKey('name')) {
            return MaterialPageRoute(
              builder: (_) => OtpScreen(
                phoneNumber: args['phoneNumber']!,
                name: args['name']!,
              ),
            );
          }
          // Fallback to login if args are missing
          return MaterialPageRoute(builder: (_) => const LoginScreen());

        case Routes.record:
          return MaterialPageRoute(
            builder: (context) {
              // If user is not authenticated, redirect to login
              if (!Provider.of<AuthProvider>(context, listen: false)
                  .isAuthenticated) {
                return const LoginScreen();
              }
              return const RecordScreen();
            },
          );

        case Routes.settings:
          return MaterialPageRoute(
            builder: (context) {
              // If user is not authenticated, redirect to login
              if (!Provider.of<AuthProvider>(context, listen: false)
                  .isAuthenticated) {
                return const LoginScreen();
              }
              return const SettingsScreen();
            },
          );

        case Routes.reports:
          return MaterialPageRoute(
            builder: (context) {
              // If user is not authenticated, redirect to login
              if (!Provider.of<AuthProvider>(context, listen: false)
                  .isAuthenticated) {
                return const LoginScreen();
              }
              return const ReportScreen();
            },
          );

        default:
          // Default fallback route if the requested route is not found
          return MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(),
          );
      }
    } catch (e) {
      // Handle any errors during route generation to avoid app crashes
      print("Error generating route: $e");
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("Navigation error occurred: ${e.toString()}"),
          ),
        ),
      );
    }
  }
}
