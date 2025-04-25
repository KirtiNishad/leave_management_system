import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_management_system/core/utils/app_constants.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/core/widgets/submit_button.dart';
import 'package:leave_management_system/features/auth/bloc/send_otp/send_otp_bloc.dart';
import 'package:leave_management_system/features/reset_password/bloc/reset_passowrd_bloc.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/widgets/custom_dialog.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController reEnterNewPassword = TextEditingController();
  TextEditingController otpController = TextEditingController();
  ValueNotifier<bool> _isHidden = ValueNotifier(true);
  ValueNotifier<bool> _isHiddenNew = ValueNotifier(true);
  ValueNotifier<bool> _isHiddenConfirm = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    var otpBloc = context.read<SendOtpBloc>();
    return BlocListener<SendOtpBloc, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.pop();
          AppConstants.otpBottomSheet(
              msg: state.message, controller: otpController, context: context);
          // TODO: implement listener
        } else if (state is SendOtpError) {
          context.pop();
          AppConstants.showErrorSnackbar("Failed!", state.message, context);
        } else if (state is SendOtpLoading) {
          CustomDialog.showLoader(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppbar(title: "Reset password"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                20.verticalSpace,
                Image.asset(
                  AppAssets.resetPasswordIcon,
                  height: 200.h,
                  width: 200.w,
                ),
                10.verticalSpace,
                ValueListenableBuilder(
                    valueListenable: _isHidden,
                    builder: (context, value, item) {
                      return AppTextfield(
                        controller: currentPassword,
                        hint: "Enter your Current Password",
                        prefix: Icon(Icons.password,
                            color: Theme.of(context).primaryColor),
                        label: "Current Password",
                        obscureText: value,
                        textInputAction: TextInputAction.done,
                        suffix: GestureDetector(
                          onTap: () {
                            _isHidden.value = !_isHidden.value;
                            _isHidden.notifyListeners();
                          },
                          child: value
                              ? Icon(Icons.visibility,
                                  color: Theme.of(context).colorScheme.secondary)
                              : Icon(Icons.visibility_off,
                                  color: Theme.of(context).colorScheme.secondary),
                        ),
                      );
                    }),
                15.verticalSpace,
                ValueListenableBuilder(
                    valueListenable: _isHiddenNew,
                    builder: (context, value, item) {
                      return AppTextfield(
                        controller: newPassword,
                        hint: "Enter your New Password",
                        prefix: Icon(Icons.password,
                            color: Theme.of(context).primaryColor),
                        label: "New Password",
                        obscureText: value,
                        textInputAction: TextInputAction.done,
                        suffix: GestureDetector(
                          onTap: () {
                            _isHiddenNew.value = !_isHiddenNew.value;
                            _isHiddenNew.notifyListeners();
                          },
                          child: value
                              ? Icon(Icons.visibility,
                                  color: Theme.of(context).colorScheme.secondary)
                              : Icon(Icons.visibility_off,
                                  color: Theme.of(context).colorScheme.secondary),
                        ),
                      );
                    }),
                15.verticalSpace,
                ValueListenableBuilder(
                    valueListenable: _isHiddenConfirm,
                    builder: (context, value, item) {
                      return AppTextfield(
                        controller: reEnterNewPassword,
                        hint: "Enter your Password",
                        prefix: Icon(Icons.password,
                            color: Theme.of(context).primaryColor),
                        label: "Confirm New Password",
                        obscureText: value,
                        textInputAction: TextInputAction.done,
                        suffix: GestureDetector(
                          onTap: () {
                            _isHiddenConfirm.value = !_isHiddenConfirm.value;
                            _isHiddenConfirm.notifyListeners();
                          },
                          child: value
                              ? Icon(Icons.visibility,
                                  color: Theme.of(context).colorScheme.secondary)
                              : Icon(Icons.visibility_off,
                                  color: Theme.of(context).colorScheme.secondary),
                        ),
                      );
                    }),
                15.verticalSpace,
                SubmitButton(
                    onPressed: () {
                      if (currentPassword.text.isEmpty) {
                        AppConstants.showErrorSnackbar("Password Required",
                            "Please Enter Current Password", context);
                      } else if (newPassword.text.isEmpty) {
                        AppConstants.showErrorSnackbar("Password Required",
                            "Please Enter New Password", context);
                      } else if (reEnterNewPassword.text.isEmpty) {
                        AppConstants.showErrorSnackbar("Password Required",
                            "Please Confirm New Password", context);
                      } else if (newPassword.text != reEnterNewPassword.text) {
                        AppConstants.showErrorSnackbar("Password Required",
                            "Please Confirm New Password", context);
                      } else {
                        otpBloc.add(SendOtpButtonPressed("", currentPassword.text));
                        // bloc.add(ResetPasswordStarted(
                        //     email: "",
                        //     oldPassword: currentPassword.text,
                        //     newPassword: newPassword.text));
                        // AppConstants.otpBottomSheet(controller: ,context:  context, msg: state.message);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(child: AppText(text: "Submit", color: Colors.white, fontSize: 13.sp,)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
