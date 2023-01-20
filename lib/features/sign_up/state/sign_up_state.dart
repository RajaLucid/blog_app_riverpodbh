abstract class SignUpState {
  const SignUpState();
}

class InitialSignUp extends SignUpState {
  const InitialSignUp() : super();
}

class SigningUp extends SignUpState {
  const SigningUp() : super();
}

class SignedUp extends SignUpState {
  const SignedUp() : super();
}

class SignUpError extends SignUpState {
  final String? message;
  SignUpError({required this.message}) : super();



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SignUpError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'SignUpError(message: $message)';
}

extension SignUpStateUnion on SignUpState {
  T map<T>({
    required T Function(InitialSignUp) initialSignUp,
    required T Function(SigningUp) signingUp,
    required T Function(SignedUp) signedUp,
    required T Function(SignUpError) signUpError,
  }) {
    if (this is InitialSignUp) {
      return initialSignUp(this as InitialSignUp);
    }
    if (this is SigningUp) {
      return signingUp(this as SigningUp);
    }
    if (this is SignedUp) {
      return signedUp(this as SignedUp);
    }
    if (this is SignUpError) {
      return signUpError(this as SignUpError);
    }
    throw AssertionError('Union does not match any possible values');
  }
}