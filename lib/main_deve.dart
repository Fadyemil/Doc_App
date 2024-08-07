import 'package:doc_app/core/di/dependency_injection.dart';
// import 'package:doc_app/core/helpers/constants.dart';
// import 'package:doc_app/core/helpers/extensions.dart';
import 'package:doc_app/core/helpers/security.dart';
import 'package:doc_app/core/helpers/shared_pref_helper.dart';
// import 'package:doc_app/core/helpers/shared_pref_helper.dart';
import 'package:doc_app/core/routing/app_router.dart';
import 'package:doc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Security.filename);
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await SharedPrefHelper.getBool('isFirstTime') ?? true;
  bool isLoggedIn = await SharedPrefHelper.getBool('isLoggedIn') ?? false;
  runApp(
    DocApp(
      appRouter: AppRouter(),
      isFirstTime: isFirstTime,
      isLoggedIn: isLoggedIn,
    ),
  );
}

// checkIfLoggedInUser() async {
//   String? userToken =
//       await SharedPrefHelper.getString(SharedPrefKeys.userToken);
//   if (!userToken.isNullOrEmpty()) {
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }
