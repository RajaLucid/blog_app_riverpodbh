import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/controller/provider/all_blogs_notifier_provider.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/presentation/widgets/all_blog_list_view.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/state/all_blogs_state.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(userdbServiceProvider).deleteAccessToken();
              Global.showCustomSnackBar(
                title: "Success",
                message: "you have been logged out",
                contentType: ContentType.success,
              );
              ref.read(autorouterProvider).replaceAll([const SigninRouter()]);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final blogState = ref.watch(allBlogsNotifierProvider);
          if (blogState is InitialAllBlogsState) {
            ref.invalidate(allBlogsNotifierProvider);
            return const Center(
              child: Text("Welcome to Blog App"),
            );
          }
          if (blogState is AllBlogsLoadingState) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Loading..."),
                ],
              ),
            );
          }
          if (blogState is AllBlogsLoadedState) {
            // ref.invalidate(allBlogsNotifierProvider);
            return AllBlogsListView(
              blogState: blogState,
              onRefresh:()=> ref.invalidate(allBlogsNotifierProvider),
            );
          }
          if (blogState is AllBlogsErrorState) {
            return Center(
              child: Text(blogState.message),
            );
          }
          return const Center(
            child: Text("Something went wrong.."),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(autorouterProvider).navigate(const AddABlogRouter());
        },
        backgroundColor: Colors.teal.shade900,
        child: const Icon(Icons.add_comment),
      ),
    );
  }
}
