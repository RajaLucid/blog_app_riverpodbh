import 'package:blog_app_riverpod/data/services/theme/i_theme_service.dart';
import 'package:blog_app_riverpod/data/services/theme/theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeServicePod = Provider.autoDispose<IThemeService>(
  (ref) => ThemeService(),
);
