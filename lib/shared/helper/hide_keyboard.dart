import 'package:blog_app_riverpod/shared/helper/global_context.dart';
import 'package:flutter/material.dart';

void hideKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(Global.context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
