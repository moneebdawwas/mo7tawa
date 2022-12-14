// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomShadowContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry padding;
  double radius;
  Color color;
  CustomShadowContainer({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(10),
    this.radius = 10,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: child,
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 1,
              color: Colors.yellow.withOpacity(0.8),
              offset: Offset(0, -5),
            ),
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 1,
              color: Colors.yellow.withOpacity(0.8),
              offset: Offset(5, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(radius)),
    );
  }
}
