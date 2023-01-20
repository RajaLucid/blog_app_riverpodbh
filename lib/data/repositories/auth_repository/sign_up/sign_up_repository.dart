import 'package:blog_app_riverpod/shared/helper/response_format_checker.dart';

import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/i_sign_up_provider.dart';
import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_up/i_sign_up_repository.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:multiple_result/multiple_result.dart';

class SignUpRepository implements ISignUpRepository {
  final ISignUpProvider signUpProvider;
  final IUserDbService userDbService;
  SignUpRepository({
    required this.signUpProvider,
    required this.userDbService,
  });

  @override
  Future<Result<bool, BaseException>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    var response = await signUpProvider.signUp(
      name: name,
      email: email,
      password: password,
    );

    if (response.statusCode == 201) {
      if (response.isFormatValid(key: "id")) {
       
        return const Success(true);
      } else {
        return Error(
          BaseException(
            message: response.getErrorMessage(
              errorKey: 'Message',
            ),
          ),
        );
      }
    } else {
      return Error(
        BaseException(
          message: response.getErrorMessage(
            errorKey: 'Message',
          ),
        ),
      );
    }
  }
}
