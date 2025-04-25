import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_system/core/widgets/app_text.dart';
import 'package:leave_management_system/core/widgets/common_appbar.dart';
import 'package:leave_management_system/features/holidays/bloc/holidays_bloc.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/shimmer.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Holidays"),
      body: BlocConsumer<HolidaysBloc, HolidaysState>(
        builder: (context, state) {
          print(state);
          if (state is HolidaysSuccess) {
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
          } else if (state is HolidaysError) {
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
          if (state is HolidaysError) {
            AppConstants.showErrorSnackbar("Failed!", state.msg, context);
          }
        },
      ),
    );
  }
}
