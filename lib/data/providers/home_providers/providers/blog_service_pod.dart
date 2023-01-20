import 'package:blog_app_riverpod/data/providers/home_providers/provider_sservices/blog_services_provider.dart';
import 'package:blog_app_riverpod/data/providers/home_providers/provider_sservices/i_blog_service_provider.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';
import 'package:blog_app_riverpod/shared/dio/dio_client_provider.dart';
import 'package:blog_app_riverpod/shared/pod/blog_db_services_pod.dart';
import 'package:blog_app_riverpod/shared/pod/user_db_service_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogServicePod = Provider.autoDispose<IBlogServicesProvider>((ref) {
  return BlogServicesProvider(
    appRouter: ref.watch(autorouterProvider),
    dio: ref.watch(dioProvider),
    userDbService: ref.watch(userdbServiceProvider),
    blogDbServices: ref.watch(blogDbServicesProvider),
  );
});
