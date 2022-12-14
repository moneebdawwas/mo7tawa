import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ));
  }
}
