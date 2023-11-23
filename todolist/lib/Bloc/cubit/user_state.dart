// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

class UsersLoaded extends UserState {
  List<User> users;
  UsersLoaded({
    required this.users,
  });
}

class UserFaliur extends UserState {
  Exception e;
  UserFaliur({
    required this.e,
  });
}
