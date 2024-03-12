part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;

  const LoginErrorState({required this.message});
}

class LoginSuccessState extends AuthState {}

class SignupLoadingState extends AuthState {}

class SignupErrorState extends AuthState {
  final String message;

  const SignupErrorState({required this.message});
}

class SignupSuccessState extends AuthState {
  final UserEntity user;

  const SignupSuccessState({required this.user});
}

class LogoutLoadingState extends AuthState {}

class LogoutErrorState extends AuthState {
  final String message;

  const LogoutErrorState({required this.message});
}

class LogoutSuccessState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String message;

  const ResetPasswordErrorState({required this.message});
}

class ResetPasswordSuccessState extends AuthState {}