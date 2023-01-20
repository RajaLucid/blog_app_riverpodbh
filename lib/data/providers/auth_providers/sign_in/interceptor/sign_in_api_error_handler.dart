import 'dart:io';

import 'package:blog_app_riverpod/shared/widgets/socket_exception_dialog.dart';
import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';

void handleSignInAPIError(
    DioError err, ErrorInterceptorHandler handler, Dio dio) async {
  Logger.log("${err.type} ${err.response?.data}");
  switch (err.type) {
    case DioErrorType.connectTimeout:
      handler.resolve(Response(
          data: 'connect timeout error', requestOptions: err.requestOptions));
      break;
    case DioErrorType.sendTimeout:
      handler.resolve(Response(
          data: 'sending data is slow', requestOptions: err.requestOptions));
      break;
    case DioErrorType.receiveTimeout:
      handler.resolve(Response(
          data: 'receiving data is slow', requestOptions: err.requestOptions));
      break;
    case DioErrorType.response:
      if (err.response != null) {
        if (err.response!.statusCode == 404) {
          handler.resolve(Response(
              data:
                  '\n server error status code: ${err.response?.statusCode}  ${err.response?.statusMessage} \n ${err.response?.data} ',
              requestOptions: RequestOptions(path: err.requestOptions.path)));
          break;
        } else {
          handler.resolve(Response(
              requestOptions: err.requestOptions,
              data: err.response?.data ?? "Error"));
          break;
        }
      } else {
        if (!handler.isCompleted) {
          handler.resolve(
            Response(
              data: 'response error ${err.error}',
              requestOptions: err.requestOptions.copyWith(
                  connectTimeout: 0, sendTimeout: 0, receiveTimeout: 0),
            ),
          );
        }

        break;
      }
    case DioErrorType.cancel:
      handler.resolve(Response(
          data: 'user cancelled request', requestOptions: err.requestOptions));
      break;
    case DioErrorType.other:
      if (err.error is SocketException) {
        await socketExceptionErrorDialog(err, handler, dio);
        break;
      } else {
        handler.resolve(
            Response(data: 'other error', requestOptions: err.requestOptions));
      }
      handler.resolve(
          Response(data: 'other error', requestOptions: err.requestOptions));
      break;
  }
}
