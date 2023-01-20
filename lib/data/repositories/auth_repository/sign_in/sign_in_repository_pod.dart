import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_in/i_sign_in_repository.dart';
import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_in/sign_in_repository.dart';
import 'package:blog_app_riverpod/features/sign_in/controller/provider/sign_in_future_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInRepositoryPRovider = Provider.autoDispose<ISigninRepository>(
  (ref) {
    return SigninRepository(
        signInProvider: ref.watch(signinProvider),
        userDbService: ref.watch(userdbServiceProvider));
  },
);
