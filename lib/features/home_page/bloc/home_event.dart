abstract class HomeEvent {}

final class HomeInitialEvent extends HomeEvent {}

final class InternetConnectedEvent extends HomeEvent {}

final class InternetNotConnectedEvent extends HomeEvent {}

final class HomeLoadingEvent extends HomeEvent {}

final class HomeLoadedEvent extends HomeEvent {}

final class HomeErrorEvent extends HomeEvent {}
