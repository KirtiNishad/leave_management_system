import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leave_management_system/core/di.dart';
import 'package:leave_management_system/core/routes/app_route_settings.dart';
import 'package:leave_management_system/core/utils/app_themes.dart';
import 'package:leave_management_system/features/auth/bloc/login_bloc/login_bloc.dart';
import 'package:leave_management_system/features/auth/bloc/send_otp/send_otp_bloc.dart';
import 'package:leave_management_system/features/history/bloc/history_bloc.dart';
import 'package:leave_management_system/features/holidays/bloc/holidays_bloc.dart';
import 'package:leave_management_system/features/leave_request/bloc/leave_request_bloc.dart';
import 'package:leave_management_system/features/logout/bloc/logout_bloc.dart';
import 'package:leave_management_system/features/pending_leaves/bloc/pending_leaves_bloc.dart';
import 'package:leave_management_system/features/profile/bloc/profile_bloc.dart';
import 'package:leave_management_system/features/splash/bloc/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  await setup();
  await ScreenUtil.ensureScreenSize();

  runApp(

      DevicePreview(
      enabled: false,
      builder: (BuildContext context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendOtpBloc(getIt()),
        ),
        BlocProvider(
          create: (context) => PendingLeavesBloc(getIt())..add(PendingLeavesEventStarted()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(getIt())..add(HistoryEventStarted()),
        ),
        BlocProvider(
          create: (context) => LeaveRequestBloc(getIt())..add(LeaveRequestStarted()),
        ),
        BlocProvider(
          create: (context) => HolidaysBloc(getIt())..add(HolidaysEventStarted()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(getIt())..add(ProfileEventStarted()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(getIt(), getIt())
        ),
        BlocProvider(
          create: (context) => SplashBloc(getIt())
        ),
        BlocProvider(
          create: (context) => LogoutBloc(getIt(), getIt())
        ),
      ],
      child: MaterialApp.router(
        title: 'LeaveEase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: AppThemes.lightScheme(),
          useMaterial3: true,
        ),
        routerConfig: AppRouting.routes,
      ),
    );
  }
}
