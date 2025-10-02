import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio = Dio();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final response = await dio.get("https://mocki.io/v1/18372f00-41b9-4c51-9a64-bbb577ff54f8"); // tu url
          final data = response.data;

          if (event.username == data["username"] && event.password == data["password"]) {
            emit(LoginSuccess(
              username: data["username"],
              email: data["email"],
              phone: data["phone"],
            ));
          } else {
            emit(LoginFailure("Usuario o contraseña incorrectos"));
          }

      } catch (e) {
        emit(LoginFailure("Error en la conexión: $e"));
      }
    });
  }
}
