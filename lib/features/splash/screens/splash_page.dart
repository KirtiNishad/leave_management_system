import 'package:flutter/material.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:leave_management_system/core/widgets/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/app_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          AppAssets.logo,
          fit: BoxFit.fill,
        ),
        nextRoute: AppRouteNames.loginPage,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Theme.of(context).primaryColor);
  }
}
