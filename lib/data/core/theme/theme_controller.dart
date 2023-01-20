import 'package:blog_app_riverpod/data/core/theme/theme_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themecontrollerProvider =
    NotifierProvider.autoDispose<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

class ThemeModeController extends AutoDisposeNotifier<ThemeMode> {
  ThemeModeController() : super();

  void changeTheme(ThemeMode theme) async {
    state = theme;
    final themeService = ref.watch(themeServicePod);
    await themeService.setTheme(themeMode: state);
  }

  @override
  ThemeMode build() {
    loadTheme();
    return ThemeMode.system;
  }

  void loadTheme() async {
    final themeService = ref.watch(themeServicePod);
    state = await themeService.getTheme();
  }
}
