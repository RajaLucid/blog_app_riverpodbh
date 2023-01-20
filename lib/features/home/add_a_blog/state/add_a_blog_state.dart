abstract class AddABlogState {
  const AddABlogState();
}

class InitialAddABlog extends AddABlogState {
  const InitialAddABlog() : super();
}

class AddingABlog extends AddABlogState {
  const AddingABlog() : super();
}

class AddedABlog extends AddABlogState {
  const AddedABlog() : super();
}

class AddABlogError extends AddABlogState {
  final String? message;
  const AddABlogError({
    required this.message,
  }) : super();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AddABlogError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'AddABlogError(message: $message)';
}

extension AddABlogStateUnion on AddABlogState {
  T map<T>({
    required T Function(InitialAddABlog) initialAddABlog,
    required T Function(AddingABlog) addingABlog,
    required T Function(AddedABlog) addedABlog,
    required T Function(AddABlogError) addABlogError,
  }) {
    if (this is InitialAddABlog) {
      return initialAddABlog(this as InitialAddABlog);
    }
    if (this is AddingABlog) {
      return addingABlog(this as AddingABlog);
    }
    if (this is AddedABlog) {
      return addedABlog(this as AddedABlog);
    }
    if (this is AddABlogError) {
      return addABlogError(this as AddABlogError);
    }
    throw AssertionError('Union does not match any possible values');
  }
}