part of 'detailes_cubit.dart';

@immutable
sealed class DetailesState {}

final class DetailesInitial extends DetailesState {}
final class Detailesloeded extends DetailesState {
    final modelgetdata data;

  Detailesloeded({required this.data});
}
final class Detailesloeding extends DetailesState {}
final class Detailesfilure extends DetailesState {
  final String error;

  Detailesfilure({required this.error});
}
final class FavorLoadedd extends DetailesState {}
final class favfilure extends DetailesState {
  final String error;

  favfilure({required this.error});
}