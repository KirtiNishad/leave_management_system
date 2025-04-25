import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../routes/app_route_names.dart';
import '../widgets/app_text.dart';
import '../widgets/submit_button.dart';

class AppConstants {
  static RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static showErrorSnackbar(String title, String subtitle, context) {
    final snackbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: title, message: subtitle, contentType: ContentType.warning));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

  static showSuccessSnackbar(String title, String subtitle, context) {
    final snackbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: title, message: subtitle, contentType: ContentType.success));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

 static otpBottomSheet(
      {required String msg, required TextEditingController controller, context}) async {
   return await showModalBottomSheet(
       backgroundColor: Theme.of(context).primaryColor,
       isScrollControlled: true,
       enableDrag: false,
       isDismissible: false,
       sheetAnimationStyle: AnimationStyle(
           curve: Curves.easeInOut, duration: Duration(milliseconds: 500)),
       useSafeArea: true,
       elevation: 5,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
               topLeft: Radius.circular(24), topRight: Radius.circular(24))),
       context: context,
       builder: (context) {
         return SafeArea(
           child: Padding(
             padding: EdgeInsets.only(
                 bottom: (MediaQuery.of(context).viewInsets.bottom)),
             child: Container(
               width: double.infinity,
               constraints: BoxConstraints(
                 minHeight: (0.30).sh - ScreenUtil().bottomBarHeight,
                 maxHeight: 0.45.sh,
               ),
               // height: MediaQuery.of(context).size.height * 0.5,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(24),
                   gradient: LinearGradient(
                       colors: [
                         Theme.of(context).primaryColor,
                         Theme.of(context).colorScheme.secondary
                       ],
                       stops: [
                         0.4,
                         0.8
                       ],
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter)),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   15.verticalSpace,
                   Center(
                     child: AppText(
                       text: msg,
                       fontSize: 15.sp,
                     ),
                   ),
                   15.verticalSpace,
                   Pinput(
                     controller: controller,
                     isCursorAnimationEnabled: true,
                     autofillHints: const [AutofillHints.oneTimeCode],
                     // listenForMultipleSmsOnAndroid: true,
                     autofocus: true,
                     textInputAction: TextInputAction.done,
                     inputFormatters: [
                       FilteringTextInputFormatter.digitsOnly,
                     ],
                     // smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
                     hapticFeedbackType: HapticFeedbackType.heavyImpact,
                     enabled: true,
                     closeKeyboardWhenCompleted: true,

                     defaultPinTheme: PinTheme(
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8),
                       ),
                       height: 48.h,
                       width: 42.w,
                     ),
                     length: 4,
                     // androidSmsAutofillMethod:
                     //     AndroidSmsAutofillMethod.smsUserConsentApi,
                   ),
                   25.verticalSpace,
                   SubmitButton(
                       onPressed: () {
                         if (controller.text.isEmpty ||
                             controller.text.length < 4) {
                           AppConstants.showErrorSnackbar(
                               "OTP Required!", "Please Fill OTP", context);
                         } else if (controller.text != "1234") {
                           AppConstants.showErrorSnackbar("Invalid OTP!",
                               "Please Fill valid OTP", context);
                         } else {
                           context.pop();
                           context.pop();
                           showSuccessSnackbar("Success!", "OTP Verified Successfully", context);
                         }
                       },
                       child: AppText(
                         text: "Submit OTP",
                         color: Colors.white,
                       )),
                 ],
               ),
             ),
           ),
         );
       });
 }

}
