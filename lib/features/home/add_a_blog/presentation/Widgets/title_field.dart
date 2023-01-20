import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';


class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      "Title of this Blog"
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
          name: "title",
          decoration: const InputDecoration(
            hintText: "Enter the title of this blog",
            
          ),
          keyboardType: TextInputType.emailAddress,
          
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: "Enter the title of this blog",

              ),
            ],
          ),
        ),
      ),
    ].vStack();
  }
}
