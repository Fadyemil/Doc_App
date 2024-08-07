// import 'package:doc_app/core/helpers/constants.dart';
import 'package:doc_app/core/routing/app_router.dart';
import 'package:doc_app/core/routing/routes.dart';
// import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/theme/color.dart';
// import 'package:doc_app/features/home/ui/home_screen.dart';
// import 'package:doc_app/features/login/ui/login_screen.dart';
// import 'package:doc_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isFirstTime;
  final bool isLoggedIn;
  const DocApp(
      {super.key,
      required this.appRouter,
      required this.isFirstTime,
      required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DocApp',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
        ),
        initialRoute: isFirstTime
            ? Routes.onBoardingScreen
            : (isLoggedIn ? Routes.homeScreen : Routes.loginScreen),
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
