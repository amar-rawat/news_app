import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:news_app/features/home_page/bloc/home_event.dart';
import 'package:news_app/features/home_page/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String? country;
  HomeBloc({this.country}) : super(HomeInitialState()) {
    on<InternetNotConnectedEvent>(internetNotConnectedState);
    on<InternetConnectedEvent>(internetConnectedState);
    on<HomeInitialEvent>(homeInitialState);
    on<HomeLoadingEvent>(homeLoadingState);
    on<HomeLoadedEvent>(homeLoadedState);
  }

  FutureOr<void> internetNotConnectedState(
      InternetNotConnectedEvent event, Emitter<HomeState> emit) {
    emit(InternetNotConnectedState());
  }

  FutureOr<void> internetConnectedState(
      InternetConnectedEvent event, Emitter<HomeState> emit) {
    emit(InternetConnectedState());
  }

  FutureOr<void> homeInitialState(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());
  }

  FutureOr<void> homeLoadingState(
      HomeLoadingEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
  }

  FutureOr<void> homeLoadedState(
      HomeLoadedEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }
}
