part of 'send_otp_bloc.dart';

@immutable
sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}
final class SendOtpLoading extends SendOtpState {}
final class SendOtpSuccess extends SendOtpState {
  final String message;
  SendOtpSuccess({required this.message});

}
final class SendOtpError extends SendOtpState {
  final String message;
  SendOtpError({required this.message});
}
