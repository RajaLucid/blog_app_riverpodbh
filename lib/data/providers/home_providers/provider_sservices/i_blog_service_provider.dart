import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:dio/dio.dart';

abstract class IBlogServicesProvider {
  Future<Response> addABlog({required String title, required String body});
  Future<Response> deleteABlog({required Blog blog});
  Future<Response> allBlogs();
  Future<Response> updateABlog({required Blog blog});
}
