import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  TextEditingController otpController =  TextEditingController();
  SendOtpBloc() : super(SendOtpInitial()) {
    on<SendOtpButtonPressed>((event, emit) {
      emit(SendOtpLoading());
      try {
        print("OMPHOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
        emit(SendOtpSuccess(
            message: "OTP has been sent on your mobile ending with 777"));
      } catch (e) {
        emit(SendOtpError(message: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
