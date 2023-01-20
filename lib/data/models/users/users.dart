import 'dart:convert';

import 'package:flutter/foundation.dart';

class Users {
  final List<User> users;
  Users({
    required this.users,
  });

  Users copyWith({
    List<User>? users,
  }) {
    return Users(
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() => 'Users(users: $users)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Users &&
      listEquals(other.users, users);
  }

  @override
  int get hashCode => users.hashCode;
}

class User {
  final int id;
  final String password;
  final String email;
  final String name;
  User({
    required this.id,
    required this.password,
    required this.email,
    required this.name,
  });

  User copyWith({
    int? id,
    String? password,
    String? email,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      password: password ?? this.password,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, password: $password, email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.password == password &&
      other.email == email &&
      other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      password.hashCode ^
      email.hashCode ^
      name.hashCode;
  }
}