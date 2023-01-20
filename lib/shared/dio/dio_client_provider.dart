import 'dart:io';
import 'package:blog_app_riverpod/data/core/const/app_urls.dart';
import 'package:blog_app_riverpod/shared/helper/bad_certificate_fixer.dart';
import 'package:blog_app_riverpod/shared/interceptor/let_log_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:let_log/let_log.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

final dioProvider = Provider.autoDispose((ref) {
  final Dio dio = Dio();

  dio.options.baseUrl = AppUrls.baseUrl;
  // dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
  // dio.options.receiveTimeout = const Duration(seconds: 30).inMilliseconds;
  if (!kReleaseMode) {
    dio.interceptors.add(dioLoggerInterceptor);
  }
  dio.options.headers.addAll(
    {
      'content-type': 'application/json',
      'Access-Control-Allow-Origin': 'true', 
    },
  );
  dio.interceptors.addAll([
    LetLogInterceptor(),
    RetryInterceptor(
        dio: dio,
        logPrint: Logger.log, // specify log function (optional)
        // retry count (optional)
        retries: 1,
        retryDelays: [
          const Duration(seconds: 2),
          const Duration(seconds: 4),
          const Duration(seconds: 6),
        ],
        retryEvaluator: (error, i) {
          // only retry on DioError
          if (error.error is SocketException) {
            // only retry on timeout error
            return true;
          } else {
            return false;
          }
        }),
  ]);
  fixBadCertificate(dio: dio);
  return dio;
});
