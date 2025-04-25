part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}
final class HistoryLoading extends HistoryState {}
final class HistorySuccess extends HistoryState {
  final HistoryModel model;
  HistorySuccess({required this.model});
}
final class HistoryError extends HistoryState {
  final String msg;
  HistoryError({required this.msg});

}
