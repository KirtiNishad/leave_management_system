import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leave_management_system/core/routes/app_route_settings.dart';
import 'package:leave_management_system/core/utils/app_assets.dart';
import 'package:leave_management_system/core/utils/app_themes.dart';
import 'package:leave_management_system/features/auth/bloc/send_otp/send_otp_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'core/widgets/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  await ScreenUtil.ensureScreenSize();

  runApp(DevicePreview(
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
    return BlocProvider(
      create: (context) => SendOtpBloc(),
      child: MaterialApp.router(
        title: 'LeaveEase',
        theme: ThemeData(
          colorScheme: AppThemes.lightScheme(

          ),
          useMaterial3: true,
        ),
        routerConfig: AppRouting.routes,
      ),
    );
  }

}


