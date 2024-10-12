part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<modelgetdata> data;

  HomeLoaded({required this.data});
}

final class HomeLoading extends HomeState {}

final class Homefailure extends HomeState {
  final String error;

  Homefailure({required this.error});
}



