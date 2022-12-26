import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';
import 'package:majlaat/widgets/filled_button.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'الباقات',
      removeBack: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorOrange.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                      BoxShadow(
                        color: AppColors.colorOrange.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(3, 0), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomShadowText(
                        text: 'اشتراك سنوي',
                        fontSize: 30,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 40,
                          child: FilledButton(
                              background: AppColors.colorOrange,
                              title: 'اشترك الان',
                              onPressed: () {}))
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorOrange.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                      BoxShadow(
                        color: AppColors.colorOrange.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(3, 0), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomShadowText(
                        text: 'اشتراك شهري',
                        fontSize: 30,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 40,
                          child: FilledButton(
                              background: AppColors.colorOrange,
                              title: 'اشترك الان',
                              onPressed: () {}))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
