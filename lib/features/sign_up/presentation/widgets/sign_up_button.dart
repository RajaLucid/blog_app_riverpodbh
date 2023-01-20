
import 'package:blog_app_riverpod/features/sign_up/controller/provider/sign_up_state_provider.dart';
import 'package:blog_app_riverpod/features/sign_up/state/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signupStateProvider);
    if (signUpState is InitialSignUp) {
      return ElevatedButton.icon(
        icon: const Icon(
          Icons.person_outline,
        ),
        label: const Text(
          "Signup",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () => ref.read(signupStateProvider.notifier).signUp(),
      );
    }
    if (signUpState is SigningUp) {
      return const SpinKitDualRing(
        color: Colors.blue,
      ).p8();
    }
    if (signUpState is SignedUp) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.handshake,
          ),
          label: const Text(
            "SignedUp",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: null,
        ),
      );
    }
    if (signUpState is SignUpError) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 20,
        ),
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.person_remove,
          ),
          label: const Text(
            "Retry SignUp",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () => ref.read(signupStateProvider.notifier).signUp(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
