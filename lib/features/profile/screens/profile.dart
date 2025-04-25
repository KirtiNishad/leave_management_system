import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_system/core/utils/app_constants.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/features/profile/bloc/profile_bloc.dart';

import '../../../core/widgets/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Profile"),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: AppText(text: state.model.message),
                  ),
                )
              ],
            );
          } else if (state is ProfileError) {
            return Center(
              child: AppText(text: state.msg),
            );
          } else {
            return Column(
              children: [
                CustomShimmer(),
                CustomShimmer(),
                CustomShimmer(),
                CustomShimmer(),
              ],
            );
          }
        },
        listener: (context, state) {
          if (state is ProfileError) {
            AppConstants.showErrorSnackbar("Failed!", state.msg, context);
          }
        },
      ),
    );
  }
}
