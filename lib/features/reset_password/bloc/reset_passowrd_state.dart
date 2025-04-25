part of 'reset_passowrd_bloc.dart';

@immutable
sealed class ResetPassowrdState {}

final class ResetPassowrdInitial extends ResetPassowrdState {}
final class ResetPassowrdLoading extends ResetPassowrdState {}
final class ResetPassowrdSuccess extends ResetPassowrdState {
  final String msg;
  ResetPassowrdSuccess({required this.msg});
}
final class ResetPassowrdError extends ResetPassowrdState {
  final String msg;
  ResetPassowrdError({required this.msg});
}
