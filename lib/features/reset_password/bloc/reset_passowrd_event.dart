part of 'reset_passowrd_bloc.dart';

@immutable
sealed class ResetPassowrdEvent {}
class ResetPasswordStarted extends ResetPassowrdEvent{
  final String email;
  final String oldPassword;
  final String newPassword;
  ResetPasswordStarted({required this.email, required this.oldPassword, required this.newPassword});
}
