import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ISignUpRepository {
  Future<Result<bool, BaseException>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
