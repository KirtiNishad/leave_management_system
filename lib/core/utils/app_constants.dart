import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

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

  static showLoader(){

  }
}
