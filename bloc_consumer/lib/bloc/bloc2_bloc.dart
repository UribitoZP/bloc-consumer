import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc2_event.dart';
part 'bloc2_state.dart';

class Bloc2Bloc extends Bloc<Bloc2Event, Bloc2State> {
  Bloc2Bloc() : super(Bloc2Initial()) {
    on<Bloc2Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
