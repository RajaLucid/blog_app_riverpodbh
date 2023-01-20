import 'package:multiple_result/multiple_result.dart';

abstract class IUserDbService {
  Future<Result<bool, Exception>> saveAccessToken({required String token});
  Future<String> getToken();
  Future<Result<bool, Exception>> isUserAvailable();
  Future<void> deleteAccessToken();
  Future<Result<bool, Exception>> updateAccessToken({required String token});
}
