import 'package:blog_app_riverpod/features/sign_in/controller/provider/sign_in_state_provider.dart';
import 'package:blog_app_riverpod/features/sign_in/state/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(signinStateProvider);
    if (loginState is InitialSignIn) {
      return ElevatedButton.icon(
        icon: const Icon(
          Icons.person_outline,
        ),
        label: const Text(
          "Signin",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () => ref.read(signinStateProvider.notifier).login(),
      );
    }
    if (loginState is SigningIn) {
      return const SpinKitDualRing(
        color: Colors.blue,
      ).p8();
    }
    if (loginState is SignedIn) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.person_outline,
          ),
          label: const Text(
            "SignedIn",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: null,
        ),
      );
    }
    if (loginState is SignInError) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.person_outline,
          ),
          label: const Text(
            "Retry Signin",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () => ref.read(signinStateProvider.notifier).login(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
