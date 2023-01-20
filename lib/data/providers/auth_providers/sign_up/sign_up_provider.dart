import 'package:blog_app_riverpod/data/core/const/app_urls.dart';
import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/interceptor/sign_up_interceptor.dart';
import 'package:dio/dio.dart';

import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/i_sign_up_provider.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';

class SignUpProvider extends ISignUpProvider {
  final Dio dio;
  final IUserDbService userDbService;
  SignUpProvider({
    required this.dio,
    required this.userDbService,
  }) {
    dio.interceptors.addAll([
      SignUpInteceptor(
        dio: dio,
      ),
    ]);
  }
  @override
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return await dio.post(
      AppUrls.userCreate,
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
  }
}
