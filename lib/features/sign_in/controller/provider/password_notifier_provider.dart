import 'package:blog_app_riverpod/features/sign_in/controller/notifier/password_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final passwordNotifierProvider =
    NotifierProvider.autoDispose<PasswordNotifier, bool>(
  () => PasswordNotifier(),
);
