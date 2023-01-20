
import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';
import 'package:blog_app_riverpod/data/providers/home_providers/provider_sservices/i_blog_service_provider.dart';
import 'package:blog_app_riverpod/data/repositories/blog_repository/i_blog_repository_pod.dart';
import 'package:blog_app_riverpod/data/services/blog_db/i_blog_db_services.dart';
import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/shared/exception/custom_exception.dart';
import 'package:blog_app_riverpod/shared/helper/response_format_checker.dart';
import 'package:multiple_result/multiple_result.dart';

class BlogsRepository implements IBlogsRepository {
  final IBlogServicesProvider blogServicesProvider;
  final IUserDbService userDbService;
  final IBlogDbServices blogDbServices;
  BlogsRepository({
    required this.blogServicesProvider,
    required this.userDbService,
    required this.blogDbServices,
  });

  @override
  Future<Result<bool, Exception>> addABlog(
      {required String title, required String body}) async {
    var response = await blogServicesProvider.addABlog(
      title: title,
      body: body,
    );
    if (response.statusCode == 201) {
      if (response.isFormatValid(key: 'id')) {
        await blogDbServices.saveBlogId(
          id: response.data['id'],
        );
        return const Success(true);
      } else {
        return Error(
          BaseException(
            message: response.getErrorMessage(
              errorKey: 'Message',
            ),
          ),
        );
      }
    } else {
      return Error(
        BaseException(
          message: response.getErrorMessage(
            errorKey: 'Message',
          ),
        ),
      );
    }
  }

  @override
  Future<Result<bool, Exception>> delete({required Blog blog}) async {
    var response = await blogServicesProvider.deleteABlog(blog: blog);

    if (response.isFormatValid()) {
      return const Success(true);
    } else {
      return Error(
        BaseException(
          message: response.getErrorMessage(
            errorKey: 'Message',
          ),
        ),
      );
    }
  }

  @override
  Future<Result<List<Blog>, BaseException>> getAllBlogs() async {
    var response = await blogServicesProvider.allBlogs();
 
      if (response.isFormatValid()) {
        final blogs = Blogs.fromMap(response.data);
        return Success(blogs.blogs);
      }else{
        return Error(
        BaseException(
          message: response.getErrorMessage(
            errorKey: 'Message',
          ),
        ),
      );
      
    }
  }

  @override
  Future<Result<bool, Exception>> updateABlog({required Blog blog}) async {
    var response = await blogServicesProvider.updateABlog(blog: blog);

    if (response.isFormatValid(key: "detail")) {
      return const Success(true);
    } else {
      return Error(
        BaseException(
          message: response.getErrorMessage(
            errorKey: 'Message',
          ),
        ),
      );
    }
  }
}
