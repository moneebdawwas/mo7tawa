import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomNavigator {
  static push(context, {required Widget page}) {
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rotate,
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 300),
          alignment: Alignment.center,
          childCurrent: Container(),
          child: page,
        ));
  }
}
