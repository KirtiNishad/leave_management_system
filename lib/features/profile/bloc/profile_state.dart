part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileModel model;
  ProfileSuccess({required this.model});
}
final class ProfileError extends ProfileState {
  final String msg;
  ProfileError({required this.msg});

}
