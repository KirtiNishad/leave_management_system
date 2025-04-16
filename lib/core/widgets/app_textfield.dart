import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';

class AppTextfield extends StatefulWidget {
  String? label;
  TextEditingController controller;
  String hint;
  Widget? prefix;
  Widget? suffix;
  int? maxLines;
  bool? readOnly;
  TextInputAction? textInputAction;
  bool? obscureText;

  AppTextfield({super.key,
    this.label,
    required this.controller,
    this.prefix,
    this.suffix,
    required this.hint,
    this.readOnly,
    this.maxLines,
    this.textInputAction,
   this.obscureText});

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null || widget.label != "" ? AppText(
          text: widget.label.toString(), fontSize: 15.sp,) : SizedBox(),
        5.verticalSpace,
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          maxLines: widget.maxLines ?? 1,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          enabled: true,
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFFd9dfdd),
                    style: BorderStyle.solid),
              ),
              enabled: true,
              hintText: widget.hint,
              prefixIcon: widget.prefix,
              suffix: widget.suffix,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFFd9dfdd),
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFFd9dfdd),
                    style: BorderStyle.solid),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
              isDense: true,
              hintStyle: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFd9dfdd),
                  fontSize: 15.sp)),
        ),
      ],
    );
  }
}
