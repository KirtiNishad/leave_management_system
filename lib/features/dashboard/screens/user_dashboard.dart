import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_management_system/core/mock_data/app_modules.dart';
import 'package:leave_management_system/core/routes/app_route_names.dart';
import 'package:leave_management_system/core/utils/app_assets.dart';
import 'package:leave_management_system/core/utils/app_constants.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/custom_dialog.dart';
import 'package:leave_management_system/core/widgets/submit_button.dart';

import '../../logout/bloc/logout_bloc.dart';

class UserDashboard extends StatelessWidget {
  UserDashboard({super.key});

  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 180,
              // toolbarHeight: 100,
              pinned: true,
              // floating: true,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              centerTitle: true,
              title: AppText(
                text: "DASHBOARD",
                letterSpacing: 1,
                fontSize: 14.sp,
                color: Colors.white,
              ),
              leading: GestureDetector(
                onTap: () {
                  if (drawerKey.currentState!.isDrawerOpen) {
                    drawerKey.currentState?.closeDrawer();
                  } else {
                    drawerKey.currentState?.openDrawer();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.menuIcon,
                    color: Colors.white,
                    // width: 8.w,
                    // height: 8.h,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 15.horizontalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.verticalSpace,
                        AppText(
                          text: "Welcome Back!",
                          letterSpacing: 1,
                          fontSize: 19.sp,
                          color: Colors.white,
                        ),
                        AppText(
                          text: "Anurag",
                          letterSpacing: 1,
                          fontSize: 19.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 30.sp,
                    )
                  ],
                ),
              )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: AppText(
                  text: "Its all u want to do...",
                  letterSpacing: 1.0,
                  fontSize: 15.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            SliverAnimatedGrid(
                initialItemCount: AppModules.moduleList.length,
                itemBuilder: (context, index, duration) {
                  List<Map<String, String>> moduleList = AppModules.moduleList;
                  return gridTile(
                      moduleList[index]["image"] ?? "",
                      moduleList[index]["title"] ?? "",
                      AppModules.colorList[index], () {
                    if (moduleList[index]["title"] == "Leave Requests") {
                      context.pushNamed(AppRouteNames.leaveRequest);
                    } else if (moduleList[index]["title"] == "Holidays List") {
                      context.pushNamed(AppRouteNames.holidaysList);
                    } else if (moduleList[index]["title"] == "Pending leaves") {
                      context.pushNamed(AppRouteNames.pendingLeaves);
                    } else if (moduleList[index]["title"] == "History") {
                      context.pushNamed(AppRouteNames.historyScreen);
                    } else if (moduleList[index]["title"] == "Info") {
                      context.pushNamed(AppRouteNames.profileScreen);
                    }
                  }, context);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2)),
            // SliverFillRemaining()
          ],
        ),
        drawer: Drawer(
            width: 0.6.sw,
            child: Column(
              children: [
                30.verticalSpace,
                AppText(
                  text: "Menu",
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16.sp,
                ),
                10.verticalSpace,
                Divider(
                  color: Colors.grey.shade700,
                  thickness: 1,
                ),
                30.verticalSpace,
                Column(
                  children: List.generate(AppModules.moduleList.length, (i) {
                    return drawerListTile(
                        image: AppModules.moduleList[i]["image"].toString(),
                        title: AppModules.moduleList[i]["title"].toString(),
                        callBack: () {
                          if (AppModules.moduleList[i]["title"] ==
                              "Leave Requests") {
                            context.pushNamed(AppRouteNames.leaveRequest);
                          } else if (AppModules.moduleList[i]["title"] ==
                              "Holidays List") {
                            context.pushNamed(AppRouteNames.holidaysList);
                          } else if (AppModules.moduleList[i]["title"] ==
                              "Pending leaves") {
                            context.pushNamed(AppRouteNames.pendingLeaves);
                          } else if (AppModules.moduleList[i]["title"] ==
                              "History") {
                            context.pushNamed(AppRouteNames.historyScreen);
                          } else if (AppModules.moduleList[i]["title"] ==
                              "Info") {
                            context.pushNamed(AppRouteNames.profileScreen);
                          }
                        },
                        context: context);
                  }),
                ),
                drawerListTile(
                    image: AppAssets.lockIcon,
                    title: "Reset Password",
                    callBack: () {
                      context.pushNamed(AppRouteNames.resetPasswordScreen);
                    },
                    context: context),
                BlocListener<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      context.goNamed(AppRouteNames.loginPage);
                    } else if (state is LogoutError) {
                      context.pop();
                      AppConstants.showErrorSnackbar(
                          "Failed!", state.msg, context);
                    } else if (state is LogoutLoading) {
                      CustomDialog.showLoader(context);
                    }
                  },
                  child: drawerListTile(
                      image: AppAssets.logoutIcon,
                      title: "Logout",
                      callBack: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                elevation: 5,
                                title: AppText(
                                    text: "Do you want to Logout?",
                                    color: Colors.black,
                                    fontSize: 17.sp),
                                actions: [
                                  SubmitButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Center(
                                          child: AppText(
                                        text: "Cancel",
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ))),
                                  SubmitButton(
                                      onPressed: () {
                                        context
                                            .read<LogoutBloc>()
                                            .add(LogoutEventStarted());
                                      },
                                      child: Center(
                                          child: AppText(
                                        text: "Logout",
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ))),
                                ],
                              );
                            });
                      },
                      context: context),
                ),
              ],
            )),
      ),
    );
  }

  Widget gridTile(String image, String title, Color? color,
      VoidCallback? callback, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: BeveledRectangleBorder(),
        shadowColor: Colors.grey.shade300,
        child: GestureDetector(
          onTap: callback ?? () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0.1.sh,
                width: 0.1.sh,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color ?? Theme.of(context).colorScheme.secondary,
                  // borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.scaleDown,
                    height: 0.07.sh,
                    width: 0.07.sh,
                    color: Colors.white,
                  ),
                ),
              ),
              5.verticalSpace,
              Center(
                  child: AppText(
                text: title,
                fontSize: 14.sp,
                weight: FontWeight.w600,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerListTile(
      {required String image,
      required String title,
      required Function() callBack,
      required context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: GestureDetector(
        onTap: callBack,
        child: Row(
          children: [
            Image.asset(
              image,
              color: Theme.of(context).colorScheme.secondary,
              height: 25,
              width: 25,
            ),
            5.horizontalSpace,
            AppText(
              text: title,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 13.sp,
            )
          ],
        ),
      ),
    );
  }
}
