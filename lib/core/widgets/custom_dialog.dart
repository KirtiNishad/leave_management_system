import 'dart:ui';

import 'package:flutter/material.dart';

class CustomDialog {
  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          shape: BeveledRectangleBorder(),

          content: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: CircularProgressIndicator(

                    strokeWidth: 1.5,
                    strokeCap: StrokeCap.round,
                    trackGap: 5,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )),
          ),
        );
      },
    );
  }
}
