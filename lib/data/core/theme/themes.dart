import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

class Themes {
  Themes._();
  static get theme => FlexThemeData.light(
        scheme: FlexScheme.vesuviusBurn,
        surfaceMode: FlexSurfaceMode.custom,
        blendLevel: 20,
        appBarOpacity: 0.95,
        swapColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          // replace default CupertinoPageTransitionsBuilder with this
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // useMaterial3: true,
        fontFamily: GoogleFonts.getFont('Hind').fontFamily,
      );
  static get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.brandBlue,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          // replace default CupertinoPageTransitionsBuilder with this
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.getFont('Hind').fontFamily,
      );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

}
