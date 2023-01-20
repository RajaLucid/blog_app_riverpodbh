import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/data/repositories/blog_repository/blogs_repository_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:blog_app_riverpod/features/home/update_a_blog/state/update_blog_state.dart';
import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/helper/hide_keyboard.dart';

class UpdateABlogNotifier extends AutoDisposeNotifier<UpdateABlogState> {
  UpdateABlogNotifier() : super();

  final updateFormKey = GlobalKey<FormBuilderState>();

  @override
  UpdateABlogState build() {
    return const InitialUpdateABlog();
  }

  Future<void> updateABlog({required Blog blog}) async {
    final title = updateFormKey.currentState!.fields["title"]!.value.toString();
    final body = updateFormKey.currentState!.fields["body"]!.value.toString();
    hideKeyboard();
    if (updateFormKey.currentState!.validate()) {
      state = const UpdatingABlog();
      final result = await ref.read(blogRepositoryPod).updateABlog(
            blog: blog.copyWith(title: title, body: body),
          );
      result.when(
        (success) => state = const UpdatedABlog(),
        (error) {
          state = UpdateABlogError(message: error.toString());
          ScaffoldMessenger.maybeOf(Global.context)!
            ..clearSnackBars()
            ..showSnackBar(SnackBar(content: "$error❗".text.make()));
        },
      );
    }
  }
}
