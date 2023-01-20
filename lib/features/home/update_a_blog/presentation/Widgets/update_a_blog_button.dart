import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/controller/provider/all_blogs_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/controller/providers/update_blog_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/state/update_blog_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateBlogButton extends ConsumerWidget {
  const UpdateBlogButton(this.blog, {super.key});
  final Blog blog;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateBlogState = ref.watch(updateABlogNotifierPod);
    if (updateBlogState is InitialUpdateABlog) {
      return ElevatedButton.icon(
        icon: const Icon(
          Icons.check,
        ),
        label: const Text(
          "Update Blog",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          ref.read(updateABlogNotifierPod.notifier).updateABlog(blog: blog);
          ref.invalidate(allBlogsNotifierProvider);
        },
      );
    }
    if (updateBlogState is UpdatingABlog) {
      return const SpinKitDualRing(
        color: Colors.white,
      ).p8();
    }
    if (updateBlogState is UpdatedABlog) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.check_box,
          ),
          label: const Text(
            "Updated Blog",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: null,
        ),
      );
    }
    if (updateBlogState is UpdateABlogError) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.person_remove,
          ),
          label: const Text(
            "Retry Updte",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () =>
              ref.read(updateABlogNotifierPod.notifier).updateABlog(blog: blog),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
