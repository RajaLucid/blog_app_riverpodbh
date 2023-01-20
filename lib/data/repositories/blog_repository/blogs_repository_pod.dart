import 'package:blog_app_riverpod/data/providers/home_providers/providers/blog_service_pod.dart';
import 'package:blog_app_riverpod/data/repositories/blog_repository/blogs_repository.dart';
import 'package:blog_app_riverpod/data/repositories/blog_repository/i_blog_repository_pod.dart';
import 'package:blog_app_riverpod/shared/pod/blog_db_services_pod.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRepositoryPod = Provider.autoDispose<IBlogsRepository>((ref) {
  return BlogsRepository(
    blogServicesProvider: ref.watch(blogServicePod),
    userDbService: ref.watch(userdbServiceProvider),
    blogDbServices: ref.watch(blogDbServicesProvider),
  );
});
