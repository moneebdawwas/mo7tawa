// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomShadowText extends StatelessWidget {
  String text;
  Color textColor;
  double fontSize;
  Color shadowColor;
  CustomShadowText(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.fontSize = 15,
      this.shadowColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        shadows: [
          Shadow(
            offset: Offset(-1.2, 1.0),
            blurRadius: 2,
            color: shadowColor,
          ),
          Shadow(
            offset: Offset(-0.9, 0.8),
            blurRadius: 2,
            color: shadowColor,
          ),
        ],
      ),
    );
  }
}
