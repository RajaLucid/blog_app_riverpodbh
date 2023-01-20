import 'package:blog_app_riverpod/data/models/users/users.dart';
import 'package:flutter/material.dart';



@immutable
abstract class UserState {}

class InitialUserState extends UserState {}

class UsersLoadingState extends UserState {}

class UsersLoadedState extends UserState {
  final List<User> users;
  UsersLoadedState({
    required this.users,
  });
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState({
    required this.message,
  });
}
