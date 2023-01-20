import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/data/repositories/blog_repository/blogs_repository_pod.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/controller/provider/all_blogs_notifier_provider.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditDeleteButton extends ConsumerWidget {
  const EditDeleteButton({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(blogRepositoryPod);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            ref
                .watch(autorouterProvider)
                .navigate(UpdateABlogRouter(blog: blog));
          },
          color: Colors.teal.shade900,
          icon: const Icon(
            Icons.edit_note,
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "delete blog: ${blog.id}",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                      "Are you sure you want to delete this blog?"),
                  actions: [
                    Card(
                      elevation: 4,
                      child: TextButton.icon(
                        onPressed: () {
                          ref.read(autorouterProvider).pop();
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("cancel"),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      child: TextButton.icon(
                        onPressed: () {
                          ref.read(blogRepositoryPod).delete(blog: blog);
                          ref.invalidate(allBlogsNotifierProvider);
                          ref.read(autorouterProvider).pop();
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                        label: const Text(
                          "delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          color: Colors.teal.shade900,
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
