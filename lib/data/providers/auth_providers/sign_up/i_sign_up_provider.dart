

import 'package:dio/dio.dart';

abstract class ISignUpProvider{
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
  });
}