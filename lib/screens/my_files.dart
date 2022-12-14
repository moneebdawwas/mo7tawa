import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFilesScreen extends StatefulWidget {
  const MyFilesScreen({super.key});

  @override
  State<MyFilesScreen> createState() => _MyFilesScreenState();
}

class _MyFilesScreenState extends State<MyFilesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: '',
      body: Column(),
    );
  }
}
