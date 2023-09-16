import 'package:flutter/material.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';

class CustomCustomFilledButton extends StatelessWidget {
  final String title;
  Color? background;

  final VoidCallback onPressed;

  CustomCustomFilledButton({
    Key? key,
    required this.title,
    this.background = Colors.black,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade400; // Disabled color
            }
            return background!; // Regular color
          }),
        ),
        onPressed: onPressed,
        child: CustomShadowText(
          text: title,
          textColor: Colors.white,
          shadowColor: Colors.black26,
          fontSize: 20,
        ));
  }
}
