import 'package:blog_app_riverpod/features/sign_in/controller/provider/sign_in_future_provider.dart';
import 'package:blog_app_riverpod/features/sign_in/state/sign_in_state.dart';
import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/helper/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInNotifier extends AutoDisposeNotifier<SignInState> {
  SignInNotifier() : super();
  final  formKey = GlobalKey<FormBuilderState>(debugLabel: "signin");
  @override
  SignInState build() {
    return const InitialSignIn();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final username =
          formKey.currentState!.fields['username']!.value.toString();
      final password =
          formKey.currentState!.fields['password']!.value.toString();
      hideKeyboard();
      state = const SigningIn();
      final result = await ref
          .read(signInRepository)
          .login(userName: username, password: password);

      result.when(
        (success) {
           return state = const SignedIn();
        },
        (error) {
          state = SignInError(
          message: error.message.toString(),
        );
        ScaffoldMessenger.maybeOf(Global.context)!
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: "${error.message}❗".text.make()));
        },
      );

    
    }
  }
}
