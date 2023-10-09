import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? foregroundDecoration;
  const CustomContainer({Key? key,
  this.margin,
  this.child,
  this.decoration,
  this.alignment,
  this.padding,
  this.color,
  this.foregroundDecoration,
  this.height,
  this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration,
      alignment: alignment,
      padding: padding,
      color: color,
      foregroundDecoration: foregroundDecoration,
      height: height,
      width: width,
      child: child,
    );
  }
}
