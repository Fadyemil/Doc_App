// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/home_screen.dart';
import 'package:doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/login/ui/login_screen.dart';
import 'package:doc_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:doc_app/features/sign_Up/logic/cubit/sign_up_cubit.dart';
import 'package:doc_app/features/sign_Up/ui/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_app/core/di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return funHomeScreen();
      case Routes.loginScreen:
        return funLoginScreen();
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.signUpScreen:
        return funSignUpScreen();
      default:
        return funDefaultScreen(settings);
    }
  }

  MaterialPageRoute<dynamic> funHomeScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => HomeCubit(getIt())..getSpecializations(),
        child: const HomeScreen(),
      ),
    );
  }

  MaterialPageRoute<dynamic> funDefaultScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route found for this page ${settings.name}'),
        ),
      ),
    );
  }

  MaterialPageRoute<dynamic> funLoginScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginScreen(),
      ),
    );
  }

  MaterialPageRoute<dynamic> funSignUpScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => getIt<SignupCubit>(),
        child: const SignupScreen(),
      ),
    );
  }
}
