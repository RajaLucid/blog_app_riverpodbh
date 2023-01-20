import 'package:blog_app_riverpod/features/sign_in/controller/notifier/sign_in_notifier.dart';
import 'package:blog_app_riverpod/features/sign_in/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final signinStateProvider =
    NotifierProvider.autoDispose<SignInNotifier, SignInState>(
        () => SignInNotifier());
