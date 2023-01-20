import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/sign_up_provider.dart';
import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_up/sign_up_repository.dart';
import 'package:blog_app_riverpod/shared/dio/dio_client_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider = Provider.autoDispose((ref) {
  return SignUpProvider(
    dio: ref.watch(dioProvider),
    userDbService: ref.watch(userdbServiceProvider),
  );
});

final signUpRepository = Provider.autoDispose((ref) {
  return SignUpRepository(
    signUpProvider: ref.watch(signUpProvider),
    userDbService: ref.watch(userdbServiceProvider),
  );
});
