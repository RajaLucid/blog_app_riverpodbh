import 'package:blog_app_riverpod/features/sign_up/controller/provider/sign_up_state_provider.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/widgets/custom_circle_image_signup.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/widgets/email_field.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/widgets/password_field.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/widgets/sign_up_button.dart';
import 'package:blog_app_riverpod/features/sign_up/presentation/widgets/user_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpNotifier = ref.watch(signupStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: [ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomCircleImageSignUp(height: 100, width: 100),
              const SizedBox(
                height: 30,
              ),
              FormBuilder(
                key: signUpNotifier.formKey,
                child: Column(
                  children: [
                    const SignUpUserNameField(),
                    const SignUpEmailField(),
                    const SignUpPasswordField(),
                    const SignUpButton().py16(),
                  ],
                ),
              ),
            ],
          ),],
         
        ),
      ),
    );
  }
}
