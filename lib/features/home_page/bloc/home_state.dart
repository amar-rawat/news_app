abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitialState extends HomeState {}

final class InternetConnectedState extends HomeState {}

final class InternetNotConnectedState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {}

final class HomeErrorState extends HomeState {}
