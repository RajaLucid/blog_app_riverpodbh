import 'package:blog_app_riverpod/features/home/add_a_blog/controller/notifier/add_a_blog_notifier.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/state/add_a_blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addABlogNotifierProvider = NotifierProvider.autoDispose<AddABlogNotifier, AddABlogState>(() => AddABlogNotifier(),);