import 'package:bloc/bloc.dart';
import 'success_state.dart';

class SuccessCubit extends Cubit<SuccessState> {
  SuccessCubit() : super(SuccessInitial());

  Future<void> loadData() async {
    emit(SuccessLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(SuccessLoaded());
  }
}
