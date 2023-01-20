

import 'package:auto_route/annotations.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/presentation/add_a_blog_view.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/presentation/homes_view.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/presentation/update_a_blog_view.dart';
import 'package:blog_app_riverpod/features/sign_in/presentation/sign_in_view.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/sign_up_view.dart';
import 'package:blog_app_riverpod/features/splash/presentation/splash_view.dart';
import 'package:blog_app_riverpod/routes/auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/splash',
      page: SplashView,
      name: 'splashRouter',
      guards: [SplashGuard],
      initial: true,
      deferredLoading: true,
    ),
    AutoRoute(
      path: '/signup',
      page: SignUpView,
      name: 'signupRouter',
      deferredLoading: true,
    ),
     AutoRoute(
      path: '/signin',
      page: SignInView,
      name: 'signinRouter',
      deferredLoading: true,
    ),
     AutoRoute(
      path: '/home',
      page: HomeView,
      name: 'homeRouter',
      guards: [AuthGuard],
      deferredLoading: true,
    ),
    AutoRoute(
      path: '/addABlog',
      page: AddABlogView,
      name: 'addABlogRouter',
      guards: [AuthGuard],
      deferredLoading: true,
    ),
    AutoRoute(
      path: '/updateABlog',
      page: UpdateABlogView,
      name: 'updateABlogRouter',
      guards: [AuthGuard],
      deferredLoading: true,
    ),
  ],
  deferredLoading: true,
)
class $AppRouter {}
