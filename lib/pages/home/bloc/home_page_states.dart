class HomePageStates {
  final int index;
  const HomePageStates({this.index = 0});

  HomePageStates copyWith({int? index}) {
    return HomePageStates(index: index ?? this.index);
  }
}
