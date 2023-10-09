import 'package:flutter/material.dart';

class CustomSizedBoxWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const CustomSizedBoxWidget({Key? key, this.height, this.width, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
