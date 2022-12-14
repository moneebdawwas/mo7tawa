import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final double? borderRadius;

  CustomInkwell({
    Key? key,
    required this.child,
    required this.onTap,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius!),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        // highlightColor: CustomColors.cFIBlueGrey.withOpacity(0.3),
        // splashColor: CustomColors.cFIBlueGrey,
        // focusColor: CustomColors.cFIBlueGrey,
        // hoverColor: CustomColors.cFIBlueGrey,
        overlayColor: MaterialStateProperty.all(
          Colors.white30,
        ),
        onTap: onTap,
        child: child,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
    );
  }
}
