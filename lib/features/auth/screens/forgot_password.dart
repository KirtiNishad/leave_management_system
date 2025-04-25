import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_themes.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/widgets/custom_dialog.dart';
import '../../../core/widgets/submit_button.dart';
import '../bloc/send_otp/send_otp_bloc.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SendOtpBloc>();
    return BlocListener<SendOtpBloc, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.pop();
          AppConstants.otpBottomSheet(controller:  bloc.otpController,context:  context, msg: state.message);
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
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              text: "Forgot Password",
              weight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        elevation: 2,
        foregroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.grey.shade300,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              20.verticalSpace,
              AppText(
                text: "Forgot password?, Don't worry",
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18.sp,
                letterSpacing: 1,
              ),
              Image.asset(
                AppAssets.forgotPassword,
                height: 300.h,
                width: 300.w,
              ),
              10.verticalSpace,
              AppTextfield(
                label: "Email",
                controller: emailController,
                hint: "Enter your Email",
                prefix: Icon(Icons.alternate_email,
                    color: Theme.of(context).primaryColor),
              ),
              20.verticalSpace,
              SubmitButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      AppConstants.showErrorSnackbar(
                          "Email Required!", "Please Enter your Email", context);
                    } else if (!AppConstants.emailRegex
                        .hasMatch(emailController.text)) {
                      AppConstants.showErrorSnackbar(
                          "Email Invalid!", "Please Enter valid Email", context);
                    } else {
                      bloc.add(SendOtpButtonPressed(emailController.text, ""));
                    }
                  },
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
                        Icons.security,
                        color: Colors.white,
                        size: 22.sp,
                      )
                    ],
                  )),
              20.verticalSpace,
              SubmitButton(
                  onPressed: () {
                  context.pop();
                  context.pop();
                  },
                  child: Center(
                    child: AppText(
                      text: "Move to Login",
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ),
);
  }

  // otpBottomSheet(String msg, TextEditingController controller, context) async {
  //   return await showModalBottomSheet(
  //       backgroundColor: Theme.of(context).primaryColor,
  //       isScrollControlled: true,
  //       enableDrag: false,
  //       isDismissible: false,
  //       sheetAnimationStyle: AnimationStyle(
  //           curve: Curves.easeInOut, duration: Duration(milliseconds: 500)),
  //       useSafeArea: true,
  //       elevation: 5,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(24), topRight: Radius.circular(24))),
  //       context: context,
  //       builder: (context) {
  //         return SafeArea(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //                 bottom: (MediaQuery.of(context).viewInsets.bottom)),
  //             child: Container(
  //               width: double.infinity,
  //               constraints: BoxConstraints(
  //                 minHeight: (0.30).sh - ScreenUtil().bottomBarHeight,
  //                 maxHeight: 0.45.sh,
  //               ),
  //               // height: MediaQuery.of(context).size.height * 0.5,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(24),
  //                   gradient: LinearGradient(
  //                       colors: [
  //                         Theme.of(context).primaryColor,
  //                         Theme.of(context).colorScheme.secondary
  //                       ],
  //                       stops: [
  //                         0.4,
  //                         0.8
  //                       ],
  //                       begin: Alignment.bottomCenter,
  //                       end: Alignment.topCenter)),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   15.verticalSpace,
  //                   Center(
  //                     child: AppText(
  //                       text: msg,
  //                       fontSize: 15.sp,
  //                     ),
  //                   ),
  //                   15.verticalSpace,
  //                   Pinput(
  //                     controller: controller,
  //                     isCursorAnimationEnabled: true,
  //                     autofillHints: const [AutofillHints.oneTimeCode],
  //                     // listenForMultipleSmsOnAndroid: true,
  //                     autofocus: true,
  //                     textInputAction: TextInputAction.done,
  //                     inputFormatters: [
  //                       FilteringTextInputFormatter.digitsOnly,
  //                     ],
  //                     // smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
  //                     hapticFeedbackType: HapticFeedbackType.heavyImpact,
  //                     enabled: true,
  //                     closeKeyboardWhenCompleted: true,
  //
  //                     defaultPinTheme: PinTheme(
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       height: 48.h,
  //                       width: 42.w,
  //                     ),
  //                     length: 4,
  //                     // androidSmsAutofillMethod:
  //                     //     AndroidSmsAutofillMethod.smsUserConsentApi,
  //                   ),
  //                   25.verticalSpace,
  //                   SubmitButton(
  //                       onPressed: () {
  //                         if (controller.text.isEmpty ||
  //                             controller.text.length < 4) {
  //                           AppConstants.showErrorSnackbar(
  //                               "OTP Required!", "Please Fill OTP", context);
  //                         } else if (controller.text != "1234") {
  //                           AppConstants.showErrorSnackbar("Invalid OTP!",
  //                               "Please Fill valid OTP", context);
  //                         } else {
  //                           context.pop();
  //                         }
  //                       },
  //                       child: AppText(
  //                         text: "Login",
  //                         color: Colors.white,
  //                       )),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
