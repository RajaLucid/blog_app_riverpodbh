import 'package:auto_route/auto_route.dart';
import 'package:blog_app_riverpod/data/services/user_db/user_db_service.dart';
import 'package:blog_app_riverpod/routes/routers.gr.dart';
import 'package:let_log/let_log.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userdbservice = UserDbService();
    final result = await userdbservice.isUserAvailable();
    result.when(
      (success) {
        if (success) {
          resolver.next();
        } else {
          Logger.log('user_not_available');
        }
      },
      (error) {
        Logger.error('error $error ');
        router.navigate(const SigninRouter());
      },
    );
  }
}

class SplashGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userdbservice = UserDbService();
    final result = await userdbservice.isUserAvailable();

    result.when(
      (success)  async { if (success) {
        Logger.debug('user available in splash ,moved to home');
        router.replaceAll([const HomeRouter()]);
      } else {
        Logger.debug('user not available in splash ,moved to login');
        resolver.next(true);
        await Future.delayed(
          const Duration(seconds: 1),
          () async {
            await router.replaceAll([const SigninRouter()]);
          },
        );
      }},
      (error) async{ Logger.error('error $error ');
      await router.navigate(const SigninRouter());},
    );

    
  }
}
