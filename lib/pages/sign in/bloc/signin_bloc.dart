import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_event.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    // on<EmailEvent>((event, emit) {
    //   emit(state.copyWith(email: state.email));
    // });
    // on<PasswordEvent>((event, emit) {
    //   emit(state.copyWith(email: state.password));
    // });

    /// another way
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  /// create event handler for fresh code
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.password));
  }
}
