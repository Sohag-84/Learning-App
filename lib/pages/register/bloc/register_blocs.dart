import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    print("===User name: ${event.userName}===");
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    print("===User email: ${event.email}===");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    print("===User password: ${event.password}===");
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print("===User re-password: ${event.rePassword}===");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
