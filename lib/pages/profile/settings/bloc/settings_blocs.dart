import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_events.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(SettingsEvents event, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
