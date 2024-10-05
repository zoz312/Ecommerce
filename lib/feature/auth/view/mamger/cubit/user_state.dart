part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class Userloading extends UserState {}

final class Userloaded extends UserState {

   final String massage;

  Userloaded({required this.massage});
}
final class getloaded extends UserState {

   final Modelsinup modelsinup;

  getloaded({required this.modelsinup});

 
}
final class Userfailure extends UserState {
  final String error;

  Userfailure({required this.error});
}
