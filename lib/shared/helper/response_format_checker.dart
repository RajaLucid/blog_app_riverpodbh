import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';

extension ResponseFormatChecker on Response {
  bool isFormatValid({String? key}) {
    if ((statusCode != null)&&(statusCode! >= 200 &&statusCode! <=300) &&
        (key != null
            ? ((data as Map).containsKey(key) && (data as Map)[key] != null)
            : true)) {
      Logger.log('valid response');
      return true;
    } else {
      Logger.log('invalid response $data $realUri');
      return false;
    }
  }

  String getErrorMessage({String? errorKey}) {
    if (data != null && data is Map && (data[errorKey ?? 'message'] != null)) {
      return data[errorKey ?? 'message'];
    } else {
      return data.toString();
    }
  }
}
