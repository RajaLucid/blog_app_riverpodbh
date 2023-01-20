abstract class UpdateABlogState {
  const UpdateABlogState();
}

class InitialUpdateABlog extends UpdateABlogState {
  const InitialUpdateABlog() : super();
}

class UpdatingABlog extends UpdateABlogState {
  const UpdatingABlog() : super();
}

class UpdatedABlog extends UpdateABlogState {
  const UpdatedABlog() : super();
}

class UpdateABlogError extends UpdateABlogState {
  final String? message;
  const UpdateABlogError({required this.message}) : super();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateABlogError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'UpdateABlogerror(message: $message)';
}

extension UpdateABlogStateUnion on UpdateABlogState {
  T map<T>({
    required T Function(InitialUpdateABlog) initialUpdateABlog,
    required T Function(UpdatingABlog) updatingABlog,
    required T Function(UpdatedABlog) updatedABlog,
    required T Function(UpdateABlogError) updateABlogerror,
  }) {
    if (this is InitialUpdateABlog) {
      return initialUpdateABlog(this as InitialUpdateABlog);
    }
    if (this is UpdatingABlog) {
      return updatingABlog(this as UpdatingABlog);
    }
    if (this is UpdatedABlog) {
      return updatedABlog(this as UpdatedABlog);
    }
    if (this is UpdateABlogError) {
      return updateABlogerror(this as UpdateABlogError);
    }
    throw AssertionError('Union does not match any possible values');
  }
}
