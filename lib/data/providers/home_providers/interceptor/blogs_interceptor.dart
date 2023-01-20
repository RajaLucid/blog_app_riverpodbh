import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';

import 'package:blog_app_riverpod/data/providers/home_providers/interceptor/blogs_api_error_handler.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';

class BlogsInteceptor extends Interceptor {
  final Dio dio;
  final IUserDbService userDbService;
  final AppRouter appRouter;

  BlogsInteceptor({
    required this.dio,
    required this.userDbService,
    required this.appRouter,
  });
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final data = options.data;
    if (data is FormData) {
      ///print form data
      for (var item in data.fields) {
        Logger.log('${item.key} : ${item.value}');
      }
    }
    final token = await userDbService.getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handleBlogsAPIError(err, handler, dio,appRouter,userDbService);
  }
}
