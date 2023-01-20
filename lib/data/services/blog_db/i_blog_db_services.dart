import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

abstract class IBlogDbServices {
  Future<Result<bool, Exception>> saveBlogId({required int id});
  FutureOr<int> getBlogId();
  Future<void> deleteBlogId();
}
