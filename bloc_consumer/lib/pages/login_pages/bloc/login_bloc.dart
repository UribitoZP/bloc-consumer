import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio = Dio();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await dio.post(
        "https://mocki.io/v1/18372f00-41b9-4c51-9a64-bbb577ff54f8",
        data: {
          "username": event.username,
          "password": event.password,
        },
      );

      final data = response.data;

      emit(LoginSuccess(
        username: data["username"] ?? "Sin nombre",
        email: data["email"] ?? "sin@correo.com",
        phone: data["phone"] ?? "000000000",
      ));
    } catch (e) {
      emit(LoginFailure("Error en la conexión o credenciales inválidas"));
    }
  }
}
