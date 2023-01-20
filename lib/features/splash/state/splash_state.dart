abstract class SplashState {
  const SplashState();
}

class InitialSplash extends SplashState {
  InitialSplash() : super();
}

class AlreadyLoggedIn extends SplashState {
  AlreadyLoggedIn() : super();
}

class NotLoggedIn extends SplashState {
  NotLoggedIn() : super();
}

extension AuthStateUnion on SplashState {
  T map<T>({
    required T Function(InitialSplash) initialSplash,
    required T Function(AlreadyLoggedIn) loggedIn,
    required T Function(NotLoggedIn) notLoggedIn,
  }) {
    if (this is InitialSplash) {
      return initialSplash(this as InitialSplash);
    }
    if (this is AlreadyLoggedIn) {
      return loggedIn(this as AlreadyLoggedIn);
    }
    if (this is NotLoggedIn) {
      return notLoggedIn(this as NotLoggedIn);
    }
    throw AssertionError('Union does not match any possible values');
  }
}
