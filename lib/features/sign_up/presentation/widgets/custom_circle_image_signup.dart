import 'package:flutter/material.dart';

class CustomCircleImageSignUp extends StatelessWidget {
  final double height;
  final double width;
  const CustomCircleImageSignUp({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        5.0,
      ),
      child: Image.asset("assets/LucidPluslogo.webp",height: height,width: width,),
    );
  }
}
