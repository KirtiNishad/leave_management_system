part of 'leave_request_bloc.dart';

@immutable
sealed class LeaveRequestState {}

final class LeaveRequestInitial extends LeaveRequestState {}
final class LeaveRequestLoading extends LeaveRequestState {}
final class LeaveRequestSuccess extends LeaveRequestState {
  final LeaveRequestModel model;
  LeaveRequestSuccess({required this.model});
}
final class LeaveRequestError extends LeaveRequestState {
  final String msg;
  LeaveRequestError({required this.msg});

}
