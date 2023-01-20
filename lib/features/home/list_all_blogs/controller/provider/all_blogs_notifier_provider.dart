import 'package:blog_app_riverpod/features/home/list_all_blogs/controller/notifier/all_blogs_notifier.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/state/all_blogs_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allBlogsNotifierProvider = NotifierProvider.autoDispose<AllBlogsNotifier,AllBlogsState >(() => AllBlogsNotifier(),);