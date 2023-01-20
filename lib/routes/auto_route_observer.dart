import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:let_log/let_log.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Logger.debug('New route pushed: ${route.settings.name}');
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  void didPopNext() {
    Logger.debug('New route replaced:');
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void didPushNext() {}

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    Logger.debug('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    Logger.debug('Tab route re-visited: ${route.name}');
  }
}
