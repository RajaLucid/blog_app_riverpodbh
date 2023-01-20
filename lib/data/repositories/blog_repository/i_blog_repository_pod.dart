import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IBlogsRepository {
  Future<Result<bool, Exception>> addABlog(
      {required String title, required String body});
  Future<Result<bool, Exception>> delete({required Blog blog});
  Future<Result<List<Blog>,BaseException>> getAllBlogs();
  Future<Result<bool, Exception>> updateABlog({required Blog blog});
}
