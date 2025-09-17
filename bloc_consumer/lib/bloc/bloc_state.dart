abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppFailure extends AppState {}

class AppSuccess extends AppState {
  final Map<String, dynamic> data;
  AppSuccess(this.data);
}