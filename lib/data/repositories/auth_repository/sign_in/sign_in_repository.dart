import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/i_sign_in_provider.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:blog_app_riverpod/shared/helper/response_format_checker.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_sign_in_repository.dart';

class SigninRepository implements ISigninRepository {
  final ISignInProvider signInProvider;
  final IUserDbService userDbService;

  SigninRepository({
    required this.signInProvider,
    required this.userDbService,
  });

  @override
  Future<Result<bool, BaseException>> login({
    required String userName,
    required String password,
  }) async {
    var response = await signInProvider.signIn(
      username: userName,
      password: password,
    );

    if (response.statusCode == 200) {
      if (response.isFormatValid(key: 'access_token')) {
        await userDbService.saveAccessToken(
          token: response.data['access_token'],
        );
        return const Success(true);
      } else {
        return Error(BaseException(
            message: response.getErrorMessage(errorKey: 'Message')));
      }
    } else {
      return Error(BaseException(
          message: response.getErrorMessage(errorKey: 'Message')));
    }
  }
}
