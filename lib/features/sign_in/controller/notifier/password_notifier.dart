import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = state ? false : true;
  }
}
