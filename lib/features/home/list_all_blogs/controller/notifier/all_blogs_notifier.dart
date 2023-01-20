import 'package:blog_app_riverpod/data/repositories/blog_repository/blogs_repository_pod.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/state/all_blogs_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllBlogsNotifier extends AutoDisposeNotifier<AllBlogsState> {
  AllBlogsNotifier() : super();
  @override
  AllBlogsState build() {
    fetchAllBlogs();
    return const InitialAllBlogsState();
  }

  Future<void> fetchAllBlogs() async {
   state = const AllBlogsLoadingState();
      final result = await ref.watch(blogRepositoryPod).getAllBlogs();
      result.when(
        (blogs) => state = AllBlogsLoadedState(blogs: blogs),
        (error) => state = AllBlogsErrorState(message: error.toString()),
      );
  }
}
