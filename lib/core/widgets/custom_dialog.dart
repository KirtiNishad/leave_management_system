import 'package:flutter/material.dart';

class CustomDialog {
  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: -5)
                ]),
            child: const CircularProgressIndicator(
              strokeWidth: 0.7,
            ));
      },
    );
  }
}
