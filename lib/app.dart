import 'package:auto_route/auto_route.dart';
import 'package:blog_app_riverpod/data/core/theme/theme_controller.dart';
import 'package:blog_app_riverpod/data/core/theme/themes.dart';
import 'package:blog_app_riverpod/routes/auto_route_observer.dart';
import 'package:blog_app_riverpod/routes/auto_route_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final approuter = ref.watch(autorouterProvider);
    final currentTheme = ref.watch(themecontrollerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Symphony Delivery App',
      useInheritedMediaQuery: true,
      theme: Themes.theme,
      darkTheme: Themes.darkTheme,
      themeMode: currentTheme,
      builder: (context, child) {
        if (mounted) {
          child = ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1700,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(350, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(600, name: TABLET),
              const ResponsiveBreakpoint.resize(800, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ],
            background: Container(
              color: const Color(0xFFF5F5F5),
            ),
          );
          child = AnnotatedRegion<SystemUiOverlayStyle>(
            value: currentTheme == ThemeMode.dark
                ? SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.white.withOpacity(0.4),
                    systemNavigationBarColor: Colors.black,
                    systemNavigationBarDividerColor: Colors.black,
                    systemNavigationBarIconBrightness: Brightness.dark,
                  )
                : SystemUiOverlayStyle.dark.copyWith(
                    statusBarColor: Colors.white.withOpacity(0.4),
                    systemNavigationBarColor: Colors.grey,
                    systemNavigationBarDividerColor: Colors.grey,
                    systemNavigationBarIconBrightness: Brightness.light,
                  ),
            child: child,
          );
        } else {
          child = const SizedBox.shrink();
        }
        return child;
      },
      // routerConfig: autorouterProvider,
      routerDelegate: AutoRouterDelegate(
        approuter,
        navigatorObservers: () => [MyObserver()],
      ),
      routeInformationParser: approuter.defaultRouteParser(),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      //locale: DevicePreview.platform(context),
      supportedLocales: const [
        Locale('de', 'DE'),
        Locale('en', 'IN'),
      ],
    );
  }
}
