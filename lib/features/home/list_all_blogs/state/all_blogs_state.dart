
import 'package:blog_app_riverpod/data/models/blogs/blogs.dart';

abstract class AllBlogsState {
  const AllBlogsState();
}

class InitialAllBlogsState extends AllBlogsState {
  const InitialAllBlogsState() : super();
}

class AllBlogsLoadingState extends AllBlogsState {
  const AllBlogsLoadingState() : super();
}

class AllBlogsLoadedState extends AllBlogsState {
  final List<Blog> blogs;

  AllBlogsLoadedState({
    required this.blogs,
  }) : super();
}

class AllBlogsErrorState extends AllBlogsState {
  final String message;
  AllBlogsErrorState({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AllBlogsErrorState &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'AllBlogsErrorState(message: $message)';
}

extension AllBlogsStateUnion on AllBlogsState {
  T map<T>({
    required T Function(InitialAllBlogsState) initialAllBlogsState,
    required T Function(AllBlogsLoadingState) allBlogsLoadingState,
    required T Function(AllBlogsLoadedState) allBlogsLoadedState,
    required T Function(AllBlogsErrorState) allBlogsErrorState,
  }) {
    if (this is InitialAllBlogsState) {
      return initialAllBlogsState(this as InitialAllBlogsState);
    }
    if (this is AllBlogsLoadingState) {
      return allBlogsLoadingState(this as AllBlogsLoadingState);
    }
    if (this is AllBlogsLoadedState) {
      return allBlogsLoadedState(this as AllBlogsLoadedState);
    }
    if (this is AllBlogsErrorState) {
      return allBlogsErrorState(this as AllBlogsErrorState);
    }
    throw AssertionError('Union does not match any possible values');
  }
}