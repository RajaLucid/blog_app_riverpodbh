

import 'package:dio/dio.dart';

abstract class ISignInProvider{
  Future<Response> signIn({
    required String username,
    required String password,
  });
}