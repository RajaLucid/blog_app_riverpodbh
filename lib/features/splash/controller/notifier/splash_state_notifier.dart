import 'package:blog_app_riverpod/data/services/user_db/i_user_db_service.dart';
import 'package:blog_app_riverpod/features/splash/state/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:let_log/let_log.dart';

class SplashStateNotfier extends StateNotifier<SplashState> {
  final IUserDbService userDbService;
  SplashStateNotfier({required this.userDbService}) : super(InitialSplash());

  Future<void> isUserLoggedIn() async {
    var result = await userDbService.isUserAvailable();
    result.when(
      (success) async {
        Logger.log(success);
        if (success) {
          state = AlreadyLoggedIn();
        } else {
          state = NotLoggedIn();
        }
      },
      (error) => Logger.error(error),
    );
  }
}
