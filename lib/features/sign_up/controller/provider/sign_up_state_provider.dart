import 'package:blog_app_riverpod/features/sign_up/controller/notifier/sign_up_notifier.dart';
import 'package:blog_app_riverpod/features/sign_up/state/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateProvider = NotifierProvider.autoDispose<SignUpNotifier,SignUpState >(()=>SignUpNotifier());