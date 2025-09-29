part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String username;
  final String email;
  final String phone;

  LoginSuccess({
    required this.username,
    required this.email,
    required this.phone,
  });
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
