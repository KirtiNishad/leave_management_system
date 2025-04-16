import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_management_system/core/utils/app_assets.dart';
import 'package:leave_management_system/core/widgets/app_textfield.dart';
import 'package:leave_management_system/core/widgets/submit_button.dart';

import '../../../core/widgets/app_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> _isHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Color(0xFFd9dfdd),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              text: "LOGIN",
              weight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        elevation: 2,
        foregroundColor: Color(0xFFd9dfdd),
        shadowColor: Colors.grey.shade300,
        backgroundColor: Color(0xFFd9dfdd),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.verticalSpace,
            AppText(
              text: "Welcome to",
              color: Color(0xFFd9dfdd),
              fontSize: 18.sp,
              weight: FontWeight.w900,
              letterSpacing: 1,
            ),
            Image.asset(AppAssets.logoWhite),
            10.verticalSpace,
            AppTextfield(
              label: "Email",
              controller: emailController,
              hint: "Enter your Email",
              prefix: Icon(Icons.alternate_email, color: Color(0xFFd9dfdd)),
            ),
            15.verticalSpace,
            ValueListenableBuilder(
                valueListenable: _isHidden,
                builder: (context, value, item) {
                  return AppTextfield(
                    controller: passwordController,
                    hint: "Enter your Password",
                    prefix: Icon(Icons.password, color: Color(0xFFd9dfdd)),
                    label: "Password",
                    obscureText: value,
                    textInputAction: TextInputAction.done,
                    suffix: GestureDetector(
                      onTap: () {
                        _isHidden.value = !_isHidden.value;
                        _isHidden.notifyListeners();
                      },
                      child: value
                          ? Icon(Icons.visibility, color: Color(0xFFd9dfdd))
                          : Icon(Icons.visibility_off,
                              color: Color(0xFFd9dfdd)),
                    ),
                  );
                }),
            20.verticalSpace,
            SubmitButton(
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "Send OTP",
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                    5.horizontalSpace,
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 22.sp,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
