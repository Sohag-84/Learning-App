import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_events.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_states.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBlocs() : super(WelcomeState()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
