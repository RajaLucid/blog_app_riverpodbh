import 'package:blog_app_riverpod/data/core/const/app_urls.dart';
import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/interceptor/sign_in_interceptor.dart';
import 'package:dio/dio.dart';

import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/i_sign_in_provider.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';

class SignInProvider extends ISignInProvider {
  final Dio dio;
  final IUserDbService userDbService;
  SignInProvider({
    required this.dio,
    required this.userDbService,
  }) {
    dio.interceptors.addAll([
      SigninInteceptor(
        dio: dio,
      ),
    ]);
  }

  @override
  Future<Response> signIn(
      {required String username, required String password}) async {
    return await dio.post(
      AppUrls.loginJWT,
      data: FormData.fromMap({
        "username": username,
        "password": password,
      }),
    );
  }
}
