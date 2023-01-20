import 'package:blog_app_riverpod/routes/auth_guard.dart';
import 'package:blog_app_riverpod/routes/nav_keys.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final autorouterProvider = Provider.autoDispose(
  (ref) => AppRouter(
    navigatorKey: rootNavigatorKey,
    authGuard: AuthGuard(),
    splashGuard: SplashGuard(),
  ),
);
