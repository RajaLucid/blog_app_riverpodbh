import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blog_app_riverpod/features/sign_up/controller/provider/sign_up_future_provider.dart';
import 'package:blog_app_riverpod/features/sign_up/state/sign_up_state.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:blog_app_riverpod/shared/helper/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpNotifier extends AutoDisposeNotifier<SignUpState> {
  SignUpNotifier() : super();

  final formKey = GlobalKey<FormBuilderState>();

  @override
  SignUpState build() {
    return const InitialSignUp();
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      final username =
          formKey.currentState!.fields['username']!.value.toString();
      final email = formKey.currentState!.fields['email']!.value.toString();
      final password =
          formKey.currentState!.fields['password']!.value.toString();
      hideKeyboard();
      state = const SigningUp();
      final result = await ref
          .read(signUpRepository)
          .signUp(name: username, email: email, password: password);
      result.when(
        (success) {
          ref.read(autorouterProvider).replaceAll([const SigninRouter()]);
          Global.showCustomSnackBar(
            title: "Signed up",
            message: "Signed Up SuccessFully",
            contentType: ContentType.success,
          );
          return state = const SignedUp();
        },
        (error) {
          state = SignUpError(
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
