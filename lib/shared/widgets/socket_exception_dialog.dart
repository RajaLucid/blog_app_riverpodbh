import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/helper/hide_keyboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> socketExceptionErrorDialog(
  DioError err,
  ErrorInterceptorHandler handler,
  Dio dio,
) async {
  hideKeyboard();
  showDialog(
    context: Global.context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          title: const Text('No Internet Connection Available'),
          content:
              const Text('Please check your internet connection and try again'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                hideKeyboard();
                context.pop();
                var result = await dio.request(err.requestOptions.path,
                    data: err.requestOptions.data,
                    options: Options(
                      method: err.requestOptions.method,
                      contentType: err.requestOptions.contentType,
                      headers: err.requestOptions.headers,
                      responseType: err.requestOptions.responseType,
                      followRedirects: err.requestOptions.followRedirects,
                      validateStatus: err.requestOptions.validateStatus,
                      receiveDataWhenStatusError:
                          err.requestOptions.receiveDataWhenStatusError,
                      extra: err.requestOptions.extra,
                      responseDecoder: err.requestOptions.responseDecoder,
                      listFormat: err.requestOptions.listFormat,
                      maxRedirects: err.requestOptions.maxRedirects,
                      receiveTimeout: err.requestOptions.receiveTimeout,
                      sendTimeout: err.requestOptions.sendTimeout,
                      requestEncoder: err.requestOptions.requestEncoder,
                    ));
                handler.resolve(result);
              },
              child: const Text('Retry'),
            ),
            ElevatedButton(
              onPressed: () {
                hideKeyboard();
                Navigator.of(context).pop();
                handler.resolve(Response(
                  data: 'No Internet Connection',
                  requestOptions: err.requestOptions,
                ));
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
    },
  );
}
