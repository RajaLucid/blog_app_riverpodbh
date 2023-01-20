import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ISigninRepository {
  Future<Result<bool, BaseException>> login({
    required String userName,
    required String password,
  });
}
