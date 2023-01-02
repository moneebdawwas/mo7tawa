import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/helper/dp_helper.dart';
import 'package:majlaat/providers/base_provider.dart';
import 'package:majlaat/providers/home_provider.dart';
import 'package:majlaat/providers/language_provider.dart';
import 'package:majlaat/screens/show_category_screen.dart';
import 'package:majlaat/screens/splash_screen.dart';
import 'package:majlaat/widgets/custom_navigation_bar.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/i18n',
      supportedLocales: const [
        //  Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
