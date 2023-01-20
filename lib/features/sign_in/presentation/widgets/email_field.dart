import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      "Email"
          .text
          .textStyle(
            TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          )
          .make()
          .objectCenterLeft(),
      Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 4,
        ),
        child: FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: "username",
          decoration: const InputDecoration(
            hintText: "Enter the Email",
          ),
          keyboardType: TextInputType.emailAddress,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: "Enter the Email",
              ),
            ],
          ),
        ),
      ),
    ].vStack();
  }
}
