import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/features/pending_leaves/bloc/pending_leaves_bloc.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/shimmer.dart';

class PendingLeaves extends StatelessWidget {
  const PendingLeaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Pending leaves"),
      body: BlocConsumer<PendingLeavesBloc, PendingLeavesState>(
        builder: (context, state) {
          if (state is PendingLeavesSuccess) {
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
          } else if (state is PendingLeavesError) {
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
          if (state is PendingLeavesError) {
            AppConstants.showErrorSnackbar("Failed!", state.msg, context);
          }
        },
      ),


    );
  }
}
