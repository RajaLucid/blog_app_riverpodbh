import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';


class UpdateBodyField extends StatelessWidget {
  const UpdateBodyField({
    Key? key,
    required this.body,
  }) : super(key: key);
  final String body;
  @override
  Widget build(BuildContext context) {
    return [
      "Write Description body"
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
          name: "body",
          initialValue: body,
          decoration: const InputDecoration(
            hintText: "Write here...",
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: "Enter Something Inside Body",
              ),
            ],
          ),
        ),
      ),
    ].vStack();
  }
}
