part of 'send_otp_bloc.dart';

@immutable
sealed class SendOtpEvent {}
class SendOtpButtonPressed extends SendOtpEvent {
  final String email;
  final String password;

  SendOtpButtonPressed(this.email, this.password);
}
