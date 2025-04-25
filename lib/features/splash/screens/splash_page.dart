import 'package:flutter/material.dart';
import 'package:leave_management_system/core/database/hive_database.dart';
import 'package:leave_management_system/core/database/hive_database_key.dart';
import 'package:leave_management_system/core/di.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:leave_management_system/core/widgets/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/app_assets.dart';

class SplashPage extends StatelessWidget {
   SplashPage({super.key});

  final HiveDatabase databse = getIt();

  @override
  Widget build(BuildContext context) {
    // context.read<SplashBloc>().add(SplashEventStart());
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          AppAssets.logo,
          fit: BoxFit.fill,
        ),
        nextRoute: databse.getBool(HiveDatabaseKey.isLoggedIn) == true
            ? AppRouteNames.userDashboard
            : AppRouteNames.loginPage,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Theme.of(context).primaryColor);
  }
}
