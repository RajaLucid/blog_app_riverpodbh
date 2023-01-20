import 'dart:async';

import 'package:blog_app_riverpod/app.dart';

import 'package:blog_app_riverpod/init.dart';
import 'package:blog_app_riverpod/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  unawaited(init());
  runApp(ProviderScope(
     observers: [MyLogger()],
    child: const MyApp(),
  ));
}


