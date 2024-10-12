part of 'favor_cubit.dart';

@immutable
sealed class FavorState {}

final class FavorInitial extends FavorState {}
final class FavorLoaded extends FavorState {}
final class FavorLoading extends FavorState {}
final class Favorfailure extends FavorState {
   final String error;

  Favorfailure({required this.error});}
final class getFavorLoaded extends FavorState {
 final List<modelgetdatafav> data;

  getFavorLoaded({required this.data});

  }
