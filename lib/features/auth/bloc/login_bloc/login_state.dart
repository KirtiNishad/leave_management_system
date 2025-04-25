part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final String msg;
  LoginSuccess({required this.msg});

}
final class LoginError extends LoginState {
  final String msg;
  LoginError({required this.msg});
}
