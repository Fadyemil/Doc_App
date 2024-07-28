// ignore_for_file: unused_local_variable

import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/home/ui/home_screen.dart';
import 'package:doc_app/features/login/ui/Login_screen.dart';
import 'package:doc_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:doc_app/features/sign_Up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child:
                        Text(' No route found for this page ${settings.name}'),
                  ),
                ));
    }
  }
}
