part of 'appbar_bloc.dart';

@immutable
sealed class AppbarState {}

final class AppbarInitial extends AppbarState {}

final class CountrySelectClickedState extends AppbarState {}
