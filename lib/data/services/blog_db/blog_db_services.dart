import 'package:blog_app_riverpod/data/services/blog_db/i_blog_db_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_log/let_log.dart';
import 'package:multiple_result/multiple_result.dart';

class BlogDbServices implements IBlogDbServices {
  static String blogBoxName = 'myBlogIdBox';
  static String blogIdKey = 'myBlogIdKey';
  @override
  Future<void> deleteBlogId() async {
    final box = await Hive.openBox(blogBoxName);
    await box.delete(blogIdKey);
  }

  @override
  Future<int> getBlogId() async {
    final box = await Hive.openBox(blogBoxName);
    var blogId = box.get(blogIdKey);
    return blogId;
  }

  @override
  Future<Result<bool, Exception>> saveBlogId({required int id}) async {
    final box = await Hive.openBox(blogBoxName);
    Logger.log("Blog's id is: ${id.toString()}");
    await box.put(blogIdKey, id);
    return const Success(true);
  }
}
