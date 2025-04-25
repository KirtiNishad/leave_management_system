import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:leave_management_system/core/utils/app_strings.dart';

import '../../../../core/network/network_info.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final NetworkInfo _networkInfo;
  TextEditingController otpController = TextEditingController();

  SendOtpBloc(this._networkInfo) : super(SendOtpInitial()) {
    on<SendOtpButtonPressed>((event, emit) async {
      emit(SendOtpLoading());
      try {
        if (await _networkInfo.isConnected()) {
          emit(SendOtpSuccess(
              message: "OTP has been sent on your email"));
        } else {
          emit(SendOtpError(message: AppStrings.noInternet));
        }
      } catch (e) {
        emit(SendOtpError(message: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
