import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/i_sign_in_provider.dart';
import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/sign_in_provider.dart';
import 'package:blog_app_riverpod/shared/dio/dio_client_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final signinProviderPod = Provider.autoDispose<ISignInProvider>(
  (ref) {
    return SignInProvider(
        dio: ref.watch(dioProvider),
        userDbService: ref.watch(userdbServiceProvider));
  },
);
