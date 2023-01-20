import 'package:blog_app_riverpod/features/home/add_a_blog/controller/provider/add_a_blog_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/state/add_a_blog_state.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class AddABlogButton extends ConsumerWidget {
  const AddABlogButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addABlogState = ref.watch(addABlogNotifierProvider);
    if (addABlogState is InitialAddABlog) {
      return ElevatedButton.icon(
        icon: const Icon(
          Icons.person_outline,
        ),
        label: const Text(
          "Create Blog",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          ref.read(addABlogNotifierProvider.notifier).createABlog();
         
        },
      );
    }
    if (addABlogState is AddingABlog) {
      return const SpinKitDualRing(
        color: Colors.blue,
      ).p8();
    }
    if (addABlogState is AddedABlog) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.handshake,
          ),
          label: const Text(
            "Created Blog",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: null,
        ),
      );
    }
    if (addABlogState is AddABlogError) {
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
            "Retry Create A Blog",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () =>
              ref.read(addABlogNotifierProvider.notifier).createABlog(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
