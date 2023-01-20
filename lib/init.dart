import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:let_log/let_log.dart';

// ignore: import_of_legacy_library_into_null_safe
// import 'package:let_log/let_log.dart';
import 'package:platform_info/platform_info.dart';

Future<void> init() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configLogger();
  unawaited(platform.when(
    android: (() => FlutterDisplayMode.setHighRefreshRate()),
  ));
}

///Configure the logger
void configLogger() {
  // Logger.enabled = true;
  Logger.enabled = !kReleaseMode;
  Logger.config.maxLimit = 1000000000;
  Logger.config.reverse = false;
  Logger.config.printLog = true;
  Logger.config.printNet = true;

  Logger.config.setPrintNames(
    log: '[😄Log]',
    debug: '[🐛Debug]',
    warn: '[❗Warn]',
    error: '[❌Error]',
    request: '[⬆️Req]',
    response: '[⬇️Res]',
  );

  Logger.config.setTabNames(
    log: '😄',
    debug: '🐛',
    warn: '❗',
    error: '❌',
    request: '⬆️',
    response: '⬇️',
  );
}
