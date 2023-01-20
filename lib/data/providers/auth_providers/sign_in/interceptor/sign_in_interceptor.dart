import 'package:blog_app_riverpod/data/providers/auth_providers/sign_in/interceptor/sign_in_api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';

class SigninInteceptor extends Interceptor {
  final Dio dio;

  SigninInteceptor({
    required this.dio,
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
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handleSignInAPIError(err, handler, dio);
  }
}
