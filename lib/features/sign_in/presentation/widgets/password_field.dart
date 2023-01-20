import 'package:blog_app_riverpod/features/sign_in/controller/provider/password_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:velocity_x/velocity_x.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Password"
            .text
            .textStyle(
              TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            )
            .make(),
        Consumer(
          builder: (context, ref, child) {
            final isPasswordVisible = ref.watch(passwordNotifierProvider);
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4),
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                name: "password",
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Enter the Password",
                  suffixIcon: isPasswordVisible
                      ? IconButton(
                          icon: const Icon(
                            Icons.visibility_outlined,
                            color: Colors.green,
                          ),
                          onPressed: () => ref
                              .read(passwordNotifierProvider.notifier)
                              .toggle(),
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () => ref
                              .read(passwordNotifierProvider.notifier)
                              .toggle(),
                        ),
                ),
                keyboardType: TextInputType.text,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: "Enter your Password",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
