part of 'logout_bloc.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
final class LogoutLoading extends LogoutState {}
final class LogoutSuccess extends LogoutState {}
final class LogoutError extends LogoutState {
  final String msg;
  LogoutError({required this.msg});

}
