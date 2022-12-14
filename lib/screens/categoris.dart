import 'package:flutter/material.dart';

import 'package:majlaat/widgets/custom_screen.dart';

class CategorisScreen extends StatefulWidget {
  const CategorisScreen({super.key});

  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: '',
      body: Column(),
    );
  }
}
