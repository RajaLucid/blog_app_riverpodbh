import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blog_app_riverpod/routes/nav_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:velocity_x/velocity_x.dart';

class Global {
  Global._();

  static BuildContext get context => rootNavigatorKey.currentState!.context;

  static Ref get ref => context as Ref;

  static showLoadingDialog({
    BuildContext? mcontext,
  }) {
    return showDialog(
      context: mcontext ?? context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 80,
          width: 80,
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 55.0,
            ),
          ),
        ),
      ),
    );
  }

  static hideDialog({
    BuildContext? mcontext,
  }) {
    if (Navigator.canPop(mcontext ?? context)) {
      return (mcontext ?? context).pop();
    }
  }

  static Future<T?> showCDialog<T>({
    required Widget child,
    required double width,
    required double height,
    BuildContext? mcontext,
  }) {
    final backgroundcolor = context.backgroundColor.withOpacity(0.8);
    return showDialog(
      context: mcontext ?? context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundcolor,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        scrollable: true,
        content: Container(
          decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }

  static showCustomSnackBar({
    required String title,
    required String message,
    required ContentType contentType,
    BuildContext? mcontext,
  }) {
    var snackBar = SnackBar(
      elevation: 9,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(24),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(mcontext ?? context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static showCBottomSheet({
    required Widget child,
    required bool isDismissible,
    required bool enableDrag,
    double? height,
    double? elevation,
    BuildContext? mcontext,
  }) {
    return showMaterialModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      elevation: elevation,
      builder: (context) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: SizedBox(
          height: height ?? 250,
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 0.15,
            builder: (context, scrollController) => [
              BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 10),
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.close),
                      )
                          .circle(backgroundColor: context.backgroundColor)
                          .box
                          .height(40)
                          .width(40)
                          .rounded
                          .make())
                  .objectCenterLeft()
                  .p8(),
              child
            ].vStack(),
          ),
        ),
      ),
    );
  }
}
