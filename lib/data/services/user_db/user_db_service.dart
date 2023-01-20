import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_log/let_log.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_user_db_service.dart';

class UserDbService implements IUserDbService {
  static String boxName = 'myTokenBox';
  static String userKey = 'myTokenKey';

  @override
  Future<void> deleteAccessToken() async {
    final box = await Hive.openBox(boxName);
    await box.delete(userKey);
  }

  @override
  Future<Result<bool, Exception>> isUserAvailable() async {
    final box = await Hive.openBox(boxName);
    return Success(box.containsKey(userKey));
  }

  @override
  Future<Result<bool, Exception>> saveAccessToken(
      {required String token}) async {
    final box = await Hive.openBox(boxName);
    // var userbox = await Hive.openBox(userKey);
    Logger.log("User's token is : ${token.toString()}");
    box.put(userKey, token);
    return const Success(true);
  }

  @override
  Future<Result<bool, Exception>> updateAccessToken(
      {required String token}) async {
    final box = await Hive.openBox(boxName);
    box.put(userKey, token);
    return const Success(true);
  }

  @override
  Future<String> getToken() async {
    final box = await Hive.openBox(boxName);
    var token = box.get(userKey);
    return token;
  }
}
