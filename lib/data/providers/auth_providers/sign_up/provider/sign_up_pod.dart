import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/i_sign_up_provider.dart';
import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/sign_up_provider.dart';
import 'package:blog_app_riverpod/shared/dio/dio_client_provider.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProviderPod = Provider.autoDispose<ISignUpProvider>((ref) {
  final dio = ref.watch(dioProvider);
  final userDbService = ref.watch(userdbServiceProvider);
  return SignUpProvider(dio: dio, userDbService: userDbService);
});
