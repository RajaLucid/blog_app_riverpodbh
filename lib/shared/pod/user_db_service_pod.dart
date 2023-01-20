import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/data/services/user_db/user_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userdbServiceProvider = Provider.autoDispose<IUserDbService>(
  (ref) => UserDbService()
);
