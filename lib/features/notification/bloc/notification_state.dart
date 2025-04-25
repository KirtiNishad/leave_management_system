part of 'notification_bloc.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}
final class NotificationsLoading extends NotificationsState {}
final class NotificationsSuccess extends NotificationsState {
  final NotificationsModel model;
  NotificationsSuccess({required this.model});
}
final class NotificationsError extends NotificationsState {
  final String msg;
  NotificationsError({required this.msg});

}
