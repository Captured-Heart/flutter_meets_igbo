import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/enums.dart';
import 'package:igbo_flutter_locale_demo/config/constants/image_constants.dart';
import 'package:igbo_flutter_locale_demo/config/constants/nav_routes.dart';
import 'package:igbo_flutter_locale_demo/src/utils/navigation_helper.dart';
import 'package:igbo_flutter_locale_demo/src/utils/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToNexToScreen().then((_) {
      if (SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name).isNotEmpty) {
        pushReplaceNamed(context, NavRoutes.mainScreenRoute);
      } else {
        pushReplaceNamed(context, NavRoutes.createAccountScreenRoute);
      }
    });
  }

  Future<void> navigateToNexToScreen() async {
    return Future.delayed(const Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.appLogo),
            Text('Flutter Meets Igbo', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}
