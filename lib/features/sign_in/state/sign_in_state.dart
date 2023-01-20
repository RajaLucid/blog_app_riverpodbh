abstract class SignInState {
  const SignInState();
}

class InitialSignIn extends SignInState {
  const InitialSignIn() : super();
}

class SigningIn extends SignInState {
  const SigningIn() : super();
}

class SignedIn extends SignInState {
  const SignedIn() : super();
}

class SignInError extends SignInState {
  final String? message;

  const SignInError({required this.message}) : super();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'SignInError(message: $message)';
}


extension SignInStateUnion on SignInState {
  T map<T>({
    required T Function(InitialSignIn) initialSignIn,
    required T Function(SigningIn) signingIn,
    required T Function(SignedIn) signedIn,
    required T Function(SignInError) signInError,
  }) {
    if (this is InitialSignIn) {
      return initialSignIn(this as InitialSignIn);
    }
    if (this is SigningIn) {
      return signingIn(this as SigningIn);
    }
    if (this is SignedIn) {
      return signedIn(this as SignedIn);
    }
    if (this is SignInError) {
      return signInError(this as SignInError);
    }
    throw AssertionError('Union does not match any possible values');
  }
}