import 'package:flutter/material.dart';
import 'package:majlaat/is_first_time.dart';
import 'package:majlaat/providers/home_provider.dart';
import 'package:majlaat/widgets/custom_navigation_bar.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('lastEditedNew'));
    print(prefs.getString('lastEditedOld'));

    if (prefs.getString('lastEditedNew') != prefs.getString('lastEditedOld')) {
      prefs.setBool('needUpdate', true);
    } else {
      prefs.setBool('needUpdate', false);
    }

    print('Need Update :  ${prefs.getBool('needUpdate')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  CustomNavigator.push(context, page: CustomNavigationBar());

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  if (prefs.getBool('needUpdate') == true) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .homeDataRequest(context);
                  } else {
                    Provider.of<HomeProvider>(context, listen: false)
                        .getHomeData(context);
                  }
                },
                child: Text('Go  TO  Home'))
          ],
        ),
      ),
    );
  }
}
