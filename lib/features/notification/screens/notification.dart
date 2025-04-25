import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/shimmer.dart';
import '../bloc/notification_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Notifications"),
      body: BlocConsumer<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          print(state);
          if (state is NotificationsSuccess) {
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
          } else if (state is NotificationsError) {
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
                // CustomShimmer(),
              ],
            );
          }
        },
        listener: (context, state) {
          if (state is NotificationsError) {
            AppConstants.showErrorSnackbar("Failed!", state.msg, context);
          }
        },
      ),
    );
  }
}
