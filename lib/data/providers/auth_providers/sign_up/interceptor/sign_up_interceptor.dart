import 'package:blog_app_riverpod/data/providers/auth_providers/sign_up/interceptor/sign_up_api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';

class SignUpInteceptor extends Interceptor {
  final Dio dio;

  SignUpInteceptor({
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
    handleSignUpAPIError(err, handler, dio);
  }
}
