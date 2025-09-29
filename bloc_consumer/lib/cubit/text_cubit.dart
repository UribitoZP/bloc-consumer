import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  final Dio dio = Dio();

  TextCubit() : super(TextInitial());

  Future<void> login(String username, String password) async {
    emit(TextLoading());
    try {
      final response = await dio.post(
        "https://mocki.io/v1/43abbc03-5e35-4f2c-bc24-a7dcccea9911",
        data: {
          "username": username,
          "password": password,
        },
      );

      final data = response.data;

      if (username == data["username"] && password == data["password"]) {
        emit(TextSuccess(
          username: data["username"] ?? "",
          email: data["email"] ?? "",
          phone: data["phone"] ?? "",
        ));
      } else {
        emit(TextFailure("Usuario o contraseña incorrectos"));
      }
    } catch (e) {
      emit(TextFailure("Error en la conexión: $e"));
    }
  }
}
