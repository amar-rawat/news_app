import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(AppbarInitial()) {
    on<CountrySelectClickedEvent>(countrySelectClickedEvent);
  }

  FutureOr<void> countrySelectClickedEvent(
      CountrySelectClickedEvent event, Emitter<AppbarState> emit) {
    emit(CountrySelectClickedState());
  }
}
