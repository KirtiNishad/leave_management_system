import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:leave_management_system/features/auth/screens/login_screen.dart';
import 'package:leave_management_system/features/dashboard/screens/user_dashboard.dart';
import 'package:leave_management_system/features/splash/screens/splash_page.dart';

class AppRouting{
  
  static  GoRouter routes = GoRouter(

      routes: [

    GoRoute(path: AppRouteNames.splashPage,name: AppRouteNames.splashPage,
      builder: (BuildContext context, GoRouterState state) {
        return SplashPage();
      },),
    GoRoute(path: AppRouteNames.loginPage,name: AppRouteNames.loginPage,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },),
    GoRoute(path: AppRouteNames.userDashboard,name: AppRouteNames.userDashboard,
      builder: (BuildContext context, GoRouterState state) {
        return UserDashboard();
      },),

  ]);
}