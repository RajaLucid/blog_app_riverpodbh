import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_up/i_sign_up_repository.dart';
import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_up/sign_up_repository.dart';
import 'package:blog_app_riverpod/features/sign_up/controller/provider/sign_up_future_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpRepositoryProvider = Provider.autoDispose<ISignUpRepository>((ref) {
  return SignUpRepository(
    signUpProvider: ref.watch(signUpProvider),
    userDbService: ref.watch(userdbServiceProvider),
  );
});
