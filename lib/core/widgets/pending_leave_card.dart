import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/submit_button.dart';

class PendingLeaveCard extends StatelessWidget {
  String category;
  String leaveType;
  String pendingBy;
  String noOfDays;
  String reason;
  String duration;
  String appliedOn;
  VoidCallback? onPressed;

  PendingLeaveCard(
      {super.key,
      required this.category,
      required this.leaveType,
      required this.pendingBy,
      required this.noOfDays,
      required this.reason,
      required this.duration,
      required this.appliedOn,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      borderOnForeground: true,
      child: Container(
        child: Column(
          children: [
            buildRow("Category : ", category),
            buildRow("Leave Type : ", leaveType),
            buildRow("Pending by : ", pendingBy),
            buildRow("No of Days : ", noOfDays),
            buildRow("Reason : ", reason),
            buildRow("Duration : ", duration),
            buildRow("Applied on : ", appliedOn),
            SubmitButton(
                onPressed: onPressed ?? () {},
                child: Center(
                    child: AppText(
                  text: "Withdraw",
                  color: Colors.white,
                  fontSize: 13.sp,
                )))
          ],
        ),
      ),
    );
  }

  buildRow(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            color: Colors.black,
            weight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          AppText(
            text: subTitle,
            color: Colors.black45,
            weight: FontWeight.normal,
            fontSize: 15.sp,
          ),
        ],
      ),
    );
  }
}
