part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignupEvent({required this.email, required this.password, required this.name});
}


class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class ResetPassword extends AuthEvent {
  final String userEmail;
  const ResetPassword(this.userEmail);
}
