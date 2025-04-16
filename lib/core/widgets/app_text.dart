import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  String text;
  TextStyle? style;
  Color? color;
  double? fontSize;
  FontWeight? weight;
  TextDecoration? decoration;
  double? letterSpacing;

  AppText(
      {super.key,
      required this.text,
      this.style,
      this.color,
      this.fontSize,
      this.weight,
       this.decoration,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
              color: color ?? Colors.black,
              fontSize: fontSize ?? 22.sp,
              fontWeight: weight ?? FontWeight.w500,
          decoration: decoration ?? TextDecoration.none,
          letterSpacing: letterSpacing ?? 0.5,
          ),
    );
  }
}
