import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:leave_management_system/features/auth/screens/forgot_password.dart';
import 'package:leave_management_system/features/auth/screens/login_screen.dart';
import 'package:leave_management_system/features/dashboard/screens/user_dashboard.dart';
import 'package:leave_management_system/features/history/screens/history_screen.dart';
import 'package:leave_management_system/features/holidays/screens/holiday_list.dart';
import 'package:leave_management_system/features/leave_request/screens/leave_request_page.dart';
import 'package:leave_management_system/features/notification/screens/notification.dart';
import 'package:leave_management_system/features/pending_leaves/screens/pending_leaves.dart';
import 'package:leave_management_system/features/profile/screens/profile.dart';
import 'package:leave_management_system/features/reset_password/screen/reset_password.dart';
import 'package:leave_management_system/features/splash/screens/splash_page.dart';

class AppRouting {
  static GoRouter routes = GoRouter(routes: [
    GoRoute(
      path: AppRouteNames.splashPage,
      name: AppRouteNames.splashPage,
      builder: (BuildContext context, GoRouterState state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: AppRouteNames.loginPage,
      name: AppRouteNames.loginPage,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: AppRouteNames.userDashboard,
      name: AppRouteNames.userDashboard,
      builder: (BuildContext context, GoRouterState state) {
        return UserDashboard();
      },
    ),
    GoRoute(
      path: AppRouteNames.forgotPassword,
      name: AppRouteNames.forgotPassword,
      builder: (BuildContext context, GoRouterState state) {
        return ForgotPassword();
      },
    ),
    GoRoute(
      path: AppRouteNames.leaveRequest,
      name: AppRouteNames.leaveRequest,
      builder: (BuildContext context, GoRouterState state) {
        return LeaveRequestPage();
      },
    ),
    GoRoute(
      path: AppRouteNames.holidaysList,
      name: AppRouteNames.holidaysList,
      builder: (BuildContext context, GoRouterState state) {
        return HolidayList();
      },
    ),
    GoRoute(
      path: AppRouteNames.profileScreen,
      name: AppRouteNames.profileScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ProfileScreen();
      },
    ),
    GoRoute(
      path: AppRouteNames.pendingLeaves,
      name: AppRouteNames.pendingLeaves,
      builder: (BuildContext context, GoRouterState state) {
        return PendingLeaves();
      },
    ),
    GoRoute(
      path: AppRouteNames.historyScreen,
      name: AppRouteNames.historyScreen,
      builder: (BuildContext context, GoRouterState state) {
        return HistoryScreen();
      },
    ),
    GoRoute(
      path: AppRouteNames.notificationScreen,
      name: AppRouteNames.notificationScreen,
      builder: (BuildContext context, GoRouterState state) {
        return NotificationScreen();
      },
    ),
    GoRoute(
      path: AppRouteNames.resetPasswordScreen,
      name: AppRouteNames.resetPasswordScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ResetPassword();
      },
    ),
  ]);
}
