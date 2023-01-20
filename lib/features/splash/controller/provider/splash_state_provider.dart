import 'package:blog_app_riverpod/features/splash/controller/notifier/splash_state_notifier.dart';
import 'package:blog_app_riverpod/features/splash/state/splash_state.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashStateProvider =
    StateNotifierProvider.autoDispose<SplashStateNotfier, SplashState>(
  (ref) {
    return SplashStateNotfier(userDbService: ref.watch(userdbServiceProvider))
      ..isUserLoggedIn();
  },
);
