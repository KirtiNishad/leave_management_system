import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leave_management_system/core/mock_data/leaves.dart';
import 'package:leave_management_system/core/utils/app_assets.dart';
import 'package:leave_management_system/core/utils/app_constants.dart';
import 'package:leave_management_system/core/widgets/app_dropdown.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/app_textfield.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/core/widgets/submit_button.dart';

class LeaveRequestPage extends StatelessWidget {
  LeaveRequestPage({super.key});

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController reason = TextEditingController();
  ValueNotifier<String?> fileName = ValueNotifier("");
  ValueNotifier<String?> applyingDays = ValueNotifier("");
  ValueNotifier<String?> balanceDays = ValueNotifier("");

  String? leaveType;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Request Leave"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Row(
                  children: [
                    AppText(
                      text: "Leave Type",
                      fontSize: 15.sp,
                    ),
                    AppText(
                      text: "*",
                      fontSize: 18.sp,
                      color: Colors.red,
                    )
                  ],
                ),
                5.verticalSpace,
                AppDropdown(
                    selectedValue: leaveType,
                    items: LeavesMockData.leaveType
                        .map((e) => DropdownMenuItem<String>(
                            value: e.toString(),
                            child: Text(
                              e,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.sp),
                            )))
                        .toList(),
                    onChanged: (value) {
                      leaveType = value.toString();
                      print(leaveType);
                    },
                    hint: "Select Leave Type"),
                15.verticalSpace,
                // AppText(text: "From Date", fontSize: 14.sp,),
                // 5.verticalSpace,
                AppTextfield(
                  isMandatory: true,
                  controller: fromDate,
                  readOnly: true,
                  hint: "From",
                  label: "From Date",
                  onTap: () async {
                    DateTime? fDate;
                    if(toDate.text.isNotEmpty){
                      fDate  = DateTime.parse(toDate.text);
                    }
                    DateTime? date = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                              data: ThemeData.light().copyWith(
                                  textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Theme.of(context).colorScheme.secondary,
                                    onSurface:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                              child: child!);
                        },
                        context: context,
                        initialDate: fDate == null ? DateTime.now(): fDate,
                        firstDate: DateTime(DateTime.now().year),
                        lastDate: fDate == null
                            ? DateTime(DateTime.now().year + 1)
                            : fDate);
                    if (date != null) {
                      String finalDate = date.toIso8601String();
                      fromDate.text = finalDate.split("T")[0];
                    }
                    if (fDate != null && date != null) {
                      DateTime date1 =
                          DateTime(date.year, date.month, date.day);
                      DateTime date2 =
                          DateTime(fDate.year, fDate.month, fDate.day);
                      applyingDays.value =
                          date2.difference(date1).inDays.toString();
                      applyingDays.notifyListeners();
                      if(date1 == date2){
                        applyingDays.value = "1";
                        applyingDays.notifyListeners();
                      }
                    }
                  },
                  suffix: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 25,
                  ),
                ),
                15.verticalSpace,
                // AppText(text: "To Date", fontSize: 14.sp,),
                // 5.verticalSpace,
                AppTextfield(
                  isMandatory: true,
                  readOnly: true,
                  controller: toDate,
                  hint: "To",
                  label: "To Date",
                  onTap: () async {
                    DateTime? fDate;
                    if(fromDate.text.isNotEmpty){
                      fDate = DateTime.parse(fromDate.text);
                    }
                    DateTime? date = await showDatePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                              data: ThemeData.light().copyWith(
                                  textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Theme.of(context).colorScheme.secondary,
                                    onSurface:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                              child: child!);
                        },
                        initialDate: DateTime.now(),
                        firstDate: fDate != null
                            ? fDate
                            : DateTime(DateTime.now().year),
                        lastDate: DateTime(DateTime.now().year + 1));
                    int differenceInDays = 0;
                    if (date != null ) {
                      String finalDate = date.toIso8601String();
                      toDate.text = finalDate.split("T")[0];
                      if(fDate != null){
                        DateTime date1 =
                        DateTime(fDate.year, fDate.month, fDate.day);
                        DateTime date2 =
                        DateTime(date.year, date.month, date.day);
                        differenceInDays = date2.difference(date1).inDays;
                        if(date1 == date2){
                          applyingDays.value = "1";
                          applyingDays.notifyListeners();
                        }
                      }

                    }
                    applyingDays.value = differenceInDays.toString();
                    applyingDays.notifyListeners();
                  },
                  suffix: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 25,
                  ),
                ),
                15.verticalSpace,
                AppTextfield(
                  isMandatory: true,
                  controller: reason,
                  hint: "Enter Reason",
                  label: "Reason for Leave",
                  maxLines: 5,
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: "Leave Balance : ",
                      fontSize: 15.sp,
                    ),
                    ValueListenableBuilder(
                        valueListenable: balanceDays,
                        builder: (context, value, item) {
                          return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: AppText(
                                    text: value ?? "0",
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ));
                        }),
                  ],
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: "Applying For : ",
                      fontSize: 15.sp,
                    ),
                    ValueListenableBuilder(
                        valueListenable: applyingDays,
                        builder: (context, value, item) {
                          return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: AppText(
                                    text: value ?? "0",
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ));
                        }),
                  ],
                ),
                10.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 0.15.sh,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await pickFiles(context: context);
                        print("FILEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
                        print(file);
                        fileName.value = file?.path.split("/").last;
                        fileName.notifyListeners();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Image.asset(
                            AppAssets.fileIcon,
                            height: 60.h,
                          )),
                          8.verticalSpace,
                          ValueListenableBuilder(
                              valueListenable: fileName,
                              builder: (context, value, item) {
                                return AppText(
                                  text: file == null || value == ""
                                      ? "Upload File"
                                      : value.toString(),
                                  fontSize: 13.sp,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                SubmitButton(
                    onPressed: () {
                      if (leaveType == null || leaveType!.isEmpty) {
                        AppConstants.showErrorSnackbar("Leave Type Required!",
                            "Please Enter Leave Type", context);
                      } else if (fromDate.text.isEmpty) {
                        AppConstants.showErrorSnackbar(
                            "Date Required!",
                            "Please Enter Date from which you want Leave",
                            context);
                      } else if (toDate.text.isEmpty) {
                        AppConstants.showErrorSnackbar(
                            "Date Required!",
                            "Please Enter Date to which you want Leave",
                            context);
                      } else {
                        AppConstants.showSuccessSnackbar(
                            "Congratulations",
                            "Your Leave Request has been Submitted Successfully",
                            context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: AppText(
                          text: "Apply Leave",
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickFiles({context}) async {
    await showModalBottomSheet(
        context: context,
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColor,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: true,
        sheetAnimationStyle: AnimationStyle(
            curve: Curves.easeInOut, duration: Duration(milliseconds: 500)),
        useSafeArea: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        builder: (context) {
          return Container(
              height: 0.35.sh,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        file = await uploadFile("click");
                        context.pop();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 30,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: "Click Image",
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        file = await uploadFile("Pick");
                        context.pop();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 30,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: file == null
                                ? "Upload File"
                                : file!.path.split("/").last,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  Future<File?> uploadFile(String type) async {
    XFile? file;
    if (type == "click") {
      file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      }
    } else {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          "jpg",
          "pdf",
          "jpeg",
          "heic",
        ],
        allowMultiple: false,
      );
      if (result!.files.isNotEmpty) {
        return File(result.files.first.path!);
      }
    }
  }
}
