import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'bloc_event.dart';
import 'bloc_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<FetchDataPressed>((event, emit) async {
      emit(AppLoading());
      try {
        final response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/users/1"),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          emit(AppSuccess(data));
        } else {
          emit(AppFailure());
        }
      } catch (_) {
        emit(AppFailure());
      }
    });
  }
}