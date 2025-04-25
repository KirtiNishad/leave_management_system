import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/core/widgets/shimmer.dart';
import 'package:leave_management_system/features/history/bloc/history_bloc.dart';

import '../../../core/utils/app_constants.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "History"),
      body: BlocConsumer<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistorySuccess) {
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
          } else if (state is HistoryError) {
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
          if (state is HistoryError) {
            AppConstants.showErrorSnackbar("Failed!", state.msg, context);
          }
        },
      ),
    );
  }
}
