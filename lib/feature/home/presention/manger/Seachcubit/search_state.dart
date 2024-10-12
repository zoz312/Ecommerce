part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class searchloaded extends SearchState { final List<modelgetdata> data;

  searchloaded({required this.data});}
final class Searchloading extends SearchState {}
final class Searchfailure extends SearchState { final String error;

  Searchfailure({required this.error});}