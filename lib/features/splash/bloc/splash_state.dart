part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashLoading extends SplashState {}
final class SplashSuccess extends SplashState {
  final String route;
  SplashSuccess({required this.route});

}
final class SplashError extends SplashState {
  final String msg;
  SplashError({required this.msg});

}
