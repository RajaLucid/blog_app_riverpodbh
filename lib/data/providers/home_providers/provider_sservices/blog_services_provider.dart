import 'package:dio/dio.dart';

import 'package:blog_app_riverpod/data/core/const/app_urls.dart';
import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/data/providers/home_providers/interceptor/blogs_interceptor.dart';
import 'package:blog_app_riverpod/data/providers/home_providers/provider_sservices/i_blog_service_provider.dart';
import 'package:blog_app_riverpod/data/services/blog_db/i_blog_db_services.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';

class BlogServicesProvider implements IBlogServicesProvider {
  final Dio dio;
  final IUserDbService userDbService;
  final IBlogDbServices blogDbServices;
  final AppRouter appRouter;
  BlogServicesProvider({
    required this.dio,
    required this.userDbService,
    required this.blogDbServices,
    required this.appRouter,
  }) {
    dio.interceptors.addAll([
      BlogsInteceptor(
        userDbService: userDbService,
        dio: dio,
        appRouter: appRouter,
      ),
    ]);
  }

  @override
  Future<Response> addABlog(
      {required String title, required String body}) async {
    return await dio.post(
      AppUrls.createABlog,
      data: {
        "title": title,
        "body": body,
      },
    );
  }

  @override
  Future<Response> allBlogs() async {
    return await dio.get(
      AppUrls.allBlogs,
    );
  }

  @override
  Future<Response> deleteABlog({required Blog blog}) async {
    return await dio.delete(
      "${AppUrls.deleteABlog}${blog.id}",
    );
  }

  @override
  Future<Response> updateABlog({required Blog blog}) async {
    return await dio.put(
      "${AppUrls.updateABlog}${blog.id}",
      data: {
        "title": blog.title,
        "body": blog.body,
      },
    );
  }
}
