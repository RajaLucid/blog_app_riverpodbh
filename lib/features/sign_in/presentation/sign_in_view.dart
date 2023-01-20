import 'package:auto_route/auto_route.dart';
import 'package:blog_app_riverpod/features/sign_in/controller/provider/sign_in_state_provider.dart';
import 'package:blog_app_riverpod/features/sign_in/presentation/widgets/custom_circle_image_signin.dart';
import 'package:blog_app_riverpod/features/sign_in/presentation/widgets/password_field.dart';
import 'package:blog_app_riverpod/features/sign_in/presentation/widgets/sign_in_button.dart';
import 'package:blog_app_riverpod/features/sign_in/presentation/widgets/email_field.dart';
import 'package:blog_app_riverpod/features/sign_in/state/sign_in_state.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});
  void loginStateListener(
      BuildContext context, SignInState? prev, SignInState next) {
    next.map(
      initialSignIn: (p0) {},
      signingIn: (p0) {},
      signedIn: (p0) {
        context.replaceRoute(const HomeRouter());
      },
      signInError: (p0) {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(signinStateProvider.notifier);
    ref.listen(signinStateProvider,
        (previous, next) => loginStateListener(context, previous, next));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomCircleImageSignIn(
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            FormBuilder(
              key: loginNotifier.formKey,
              autoFocusOnValidationFailure: true,
              child: Column(
                children: [
                  const EmailField(),
                  const PasswordField(),
                  const SignInButton().py16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("If you are new user please"),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          ref
                              .read(autorouterProvider)
                              .navigate(const SignupRouter());
                        },
                        child: const Text(
                          "SignUp?",
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ).scrollVertical(),
    );
  }
}
