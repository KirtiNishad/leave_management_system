import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;

  SubmitButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all((Theme.of(context).colorScheme.secondary)),
            alignment: Alignment.center,
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(BeveledRectangleBorder())),
        child: child);
  }
}
