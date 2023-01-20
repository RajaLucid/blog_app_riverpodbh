import 'package:blog_app_riverpod/data/services/blog_db/blog_db_services.dart';
import 'package:blog_app_riverpod/data/services/blog_db/i_blog_db_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogDbServicesProvider = Provider.autoDispose<IBlogDbServices>((ref) {
  return BlogDbServices();
});