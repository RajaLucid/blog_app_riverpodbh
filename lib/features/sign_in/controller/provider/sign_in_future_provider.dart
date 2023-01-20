import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/sign_in_provider.dart';
import 'package:blog_app_riverpod/data/repositories/auth_repository/sign_in/sign_in_repository.dart';
import 'package:blog_app_riverpod/shared/dio/dio_client_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinProvider = Provider.autoDispose(
  (ref) => SignInProvider(
      dio: ref.watch(dioProvider),
      userDbService: ref.watch(userdbServiceProvider)),
);

final signInRepository = Provider.autoDispose(
  (ref) => SigninRepository(
      signInProvider: ref.watch(signinProvider),
      userDbService: ref.watch(userdbServiceProvider)),
);
