part of 'text_cubit.dart';

abstract class TextState {}

class TextInitial extends TextState {}

class TextLoading extends TextState {}

class TextSuccess extends TextState {
  final String username;
  final String email;
  final String phone;

  TextSuccess({
    required this.username,
    required this.email,
    required this.phone,
  });
}

class TextFailure extends TextState {
  final String message;
  TextFailure(this.message);
}
