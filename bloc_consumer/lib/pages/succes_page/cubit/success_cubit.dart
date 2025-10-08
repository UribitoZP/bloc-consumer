import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
part 'success_state.dart';

class SuccessCubit extends Cubit<SuccessState> {
  final Dio dio = Dio();

  SuccessCubit() : super(SuccessInitial());

  Future<void> fetchUserData(String username) async {
    emit(SuccessLoading());
    try {
      final response = await dio.get("https://mocki.io/v1/18372f00-41b9-4c51-9a64-bbb577ff54f8");
      final data = response.data;

      // Supongamos que esta petición devuelve más información del usuario
      if (data["username"] == username) {
        emit(SuccessLoaded(
          username: data["username"],
          email: data["email"],
          phone: data["phone"],
        ));
      } else {
        emit(SuccessError("No se encontró información del usuario"));
      }
    } catch (e) {
      emit(SuccessError("Error en la conexión: $e"));
    }
  }
}
