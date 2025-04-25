part of 'holidays_bloc.dart';

@immutable
sealed class HolidaysState {}

final class HolidaysInitial extends HolidaysState {}
final class HolidaysLoading extends HolidaysState {}
final class HolidaysSuccess extends HolidaysState {
  final HolidaysModel model;
  HolidaysSuccess({required this.model});
}
final class HolidaysError extends HolidaysState {
  final String msg;
  HolidaysError({required this.msg});

}
