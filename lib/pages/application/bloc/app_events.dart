abstract class AppEvents {
  const AppEvents();
}

class TriggerAppEvent extends AppEvents {
  final int index;
  const TriggerAppEvent(this.index) : super();
}
