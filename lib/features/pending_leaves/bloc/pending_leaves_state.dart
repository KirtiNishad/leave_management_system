part of 'pending_leaves_bloc.dart';

@immutable
sealed class PendingLeavesState {}

final class PendingLeavesInitial extends PendingLeavesState {}
final class PendingLeavesLoading extends PendingLeavesState {}
final class PendingLeavesSuccess extends PendingLeavesState {
  final PendingLeavesModel model;
  PendingLeavesSuccess({required this.model});
}
final class PendingLeavesError extends PendingLeavesState {
  final String msg;
  PendingLeavesError({required this.msg});

}
