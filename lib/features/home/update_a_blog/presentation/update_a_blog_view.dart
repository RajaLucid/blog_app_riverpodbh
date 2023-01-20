import 'package:auto_route/auto_route.dart';
import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/controller/providers/update_blog_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/presentation/Widgets/update_a_blog_button.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/presentation/Widgets/update_body_field.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/presentation/Widgets/update_title_field.dart';
import 'package:blog_app_riverpod/features/home/update_a_blog/state/update_blog_state.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateABlogView extends ConsumerWidget {
  const UpdateABlogView({super.key,required this.blog,});
  final Blog blog;
  void updateABlogStateListener(
    BuildContext context,
    UpdateABlogState? previous,
    UpdateABlogState next,
  ) {
    next.map(
      initialUpdateABlog: (p0) {},
      updatingABlog: (p0) {},
      updatedABlog: (p0) {
        AutoRouter.of(context).replaceAll([const HomeRouter()]);
      },
      updateABlogerror: (p0) {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateANotifier = ref.watch(updateABlogNotifierPod.notifier);
    ref.listen(updateABlogNotifierPod,
        (previous, next) => updateABlogStateListener(context, previous, next));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Blog"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FormBuilder(
                  key: updateANotifier.updateFormKey,
                  child: Column(
                    children:  [
                      UpdateTitleField(title: blog.title,),
                      UpdateBodyField(body: blog.body,),
                       UpdateBlogButton(blog),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
