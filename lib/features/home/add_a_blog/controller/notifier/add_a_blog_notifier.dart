import 'package:blog_app_riverpod/data/repositories/blog_repository/blogs_repository_pod.dart';

import 'package:blog_app_riverpod/features/home/add_a_blog/state/add_a_blog_state.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/controller/provider/all_blogs_notifier_provider.dart';
import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/helper/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class AddABlogNotifier extends AutoDisposeNotifier<AddABlogState> {
  AddABlogNotifier() : super();

  final addFormKey = GlobalKey<FormBuilderState>();

  @override
  AddABlogState build() {
    return const InitialAddABlog();
  }

  Future<void> createABlog() async {
    final title = addFormKey.currentState!.fields['title']!.value.toString();
    final body = addFormKey.currentState!.fields['body']!.value.toString();

    hideKeyboard();

    state = const AddingABlog();
    final result = await ref.read(blogRepositoryPod).addABlog(
          title: title,
          body: body,
        );
    result.when(
      (success) {
         ref.invalidate(allBlogsNotifierProvider);
        return state = const AddedABlog();
       
      },
      (error) {
        state = AddABlogError(
          message: error.toString(),
        );
        ScaffoldMessenger.maybeOf(Global.context)!
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: "$error❗".text.make()));
      },
    );
  }
}
