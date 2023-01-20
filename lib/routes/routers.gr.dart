// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../data/models/blogs/blogs.dart' as _i10;
import '../features/home/add_a_blog/presentation/add_a_blog_view.dart'
    deferred as _i5;
import '../features/home/list_all_blogs/presentation/homes_view.dart'
    deferred as _i4;
import '../features/home/update_a_blog/presentation/update_a_blog_view.dart'
    deferred as _i6;
import '../features/sign_in/presentation/sign_in_view.dart' deferred as _i3;
import '../features/sign_up/presentation/sign_up_view.dart' deferred as _i2;
import '../features/splash/presentation/splash_view.dart' deferred as _i1;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.splashGuard,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.SplashGuard splashGuard;

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.SplashView(),
        ),
      );
    },
    SignupRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.SignUpView(),
        ),
      );
    },
    SigninRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.SignInView(),
        ),
      );
    },
    HomeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.HomeView(),
        ),
      );
    },
    AddABlogRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.AddABlogView(),
        ),
      );
    },
    UpdateABlogRouter.name: (routeData) {
      final args = routeData.argsAs<UpdateABlogRouterArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.UpdateABlogView(
            key: args.key,
            blog: args.blog,
          ),
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          SplashRouter.name,
          path: '/splash',
          deferredLoading: true,
          guards: [splashGuard],
        ),
        _i7.RouteConfig(
          SignupRouter.name,
          path: '/signup',
          deferredLoading: true,
        ),
        _i7.RouteConfig(
          SigninRouter.name,
          path: '/signin',
          deferredLoading: true,
        ),
        _i7.RouteConfig(
          HomeRouter.name,
          path: '/home',
          deferredLoading: true,
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          AddABlogRouter.name,
          path: '/addABlog',
          deferredLoading: true,
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          UpdateABlogRouter.name,
          path: '/updateABlog',
          deferredLoading: true,
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRouter extends _i7.PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/splash',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.SignUpView]
class SignupRouter extends _i7.PageRouteInfo<void> {
  const SignupRouter()
      : super(
          SignupRouter.name,
          path: '/signup',
        );

  static const String name = 'SignupRouter';
}

/// generated route for
/// [_i3.SignInView]
class SigninRouter extends _i7.PageRouteInfo<void> {
  const SigninRouter()
      : super(
          SigninRouter.name,
          path: '/signin',
        );

  static const String name = 'SigninRouter';
}

/// generated route for
/// [_i4.HomeView]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.AddABlogView]
class AddABlogRouter extends _i7.PageRouteInfo<void> {
  const AddABlogRouter()
      : super(
          AddABlogRouter.name,
          path: '/addABlog',
        );

  static const String name = 'AddABlogRouter';
}

/// generated route for
/// [_i6.UpdateABlogView]
class UpdateABlogRouter extends _i7.PageRouteInfo<UpdateABlogRouterArgs> {
  UpdateABlogRouter({
    _i8.Key? key,
    required _i10.Blog blog,
  }) : super(
          UpdateABlogRouter.name,
          path: '/updateABlog',
          args: UpdateABlogRouterArgs(
            key: key,
            blog: blog,
          ),
        );

  static const String name = 'UpdateABlogRouter';
}

class UpdateABlogRouterArgs {
  const UpdateABlogRouterArgs({
    this.key,
    required this.blog,
  });

  final _i8.Key? key;

  final _i10.Blog blog;

  @override
  String toString() {
    return 'UpdateABlogRouterArgs{key: $key, blog: $blog}';
  }
}
