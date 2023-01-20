import 'package:auto_route/auto_route.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/controller/provider/add_a_blog_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/presentation/Widgets/add_a_blog_button.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/presentation/Widgets/body_field.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/presentation/Widgets/title_field.dart';
import 'package:blog_app_riverpod/features/home/add_a_blog/state/add_a_blog_state.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddABlogView extends ConsumerWidget {
  const AddABlogView({super.key});

  void addABlogStateListener(
    BuildContext context,
    AddABlogState? previous,
    AddABlogState next,
  ) {
    next.map(
      initialAddABlog: (p0) {},
      addingABlog: (p0) {},
      addedABlog: (p0) {
        AutoRouter.of(context).replaceAll([const HomeRouter()]);
      },
      addABlogError: (p0) {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addABlogNotifier = ref.watch(addABlogNotifierProvider.notifier);
    ref.listen(addABlogNotifierProvider,
        (previous, next) => addABlogStateListener(context, previous, next));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create A Blog"),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: [ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FormBuilder(
                key: addABlogNotifier.addFormKey,
                child: Column(
                  children: const [
                    TitleField(),
                    BodyField(),
                    AddABlogButton(),
                  ],
                ),
              ),
            ],
          ),],
         
        ),
      ),
    );
  }
}
