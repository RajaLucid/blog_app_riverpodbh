
import 'package:blog_app_riverpod/features/home/update_a_blog/controller/notifier/update_a_blog_notifier.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/state/update_blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateABlogNotifierPod = NotifierProvider
    .autoDispose<UpdateABlogNotifier, UpdateABlogState>(
        () => UpdateABlogNotifier());
