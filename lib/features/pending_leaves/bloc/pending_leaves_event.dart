part of 'pending_leaves_bloc.dart';

@immutable
sealed class PendingLeavesEvent {}
class PendingLeavesEventStarted extends PendingLeavesEvent{}
