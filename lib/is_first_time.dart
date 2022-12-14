import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

isFirstLoaded(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool firstTime = prefs.getBool('firstTime') ?? true;

  print('first Time :  ${firstTime}');
  print(prefs.getString('lastEditedNew'));
  print(prefs.getString('lastEditedOld'));
}
