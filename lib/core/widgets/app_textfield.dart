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
  void Function()? onTap;
  bool isMandatory;

  AppTextfield({super.key,
    this.label,
    required this.controller,
    this.prefix,
    this.suffix,
    required this.hint,
    this.readOnly,
    this.maxLines,
    this.textInputAction,
    this.isMandatory = false,
    this.obscureText, this.onTap});

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.label != null || widget.label != "" ? AppText(
              text: widget.label.toString(), fontSize: 15.sp,) : SizedBox(),
            widget.isMandatory == true ?
            AppText(
              text: "*", fontSize: 18.sp, color: Colors.red,) : SizedBox(),


          ],
        ),

        5.verticalSpace,
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap ?? () {},
          maxLines: widget.maxLines ?? 1,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          enabled: true,
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    style: BorderStyle.solid),
              ),
              enabled: true,
              hintText: widget.hint,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    style: BorderStyle.solid),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
              isDense: true,
              hintStyle: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontSize: 15.sp)),
        ),
      ],
    );
  }
}
