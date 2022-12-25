import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/screens/profile_screen.dart';
import 'package:majlaat/widgets/custom_inkwell.dart';
import 'package:majlaat/widgets/custom_loading_indicator.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';

class CustomScreen extends StatefulWidget {
  Widget body;
  String title;
  bool removeBack;
  bool removeProfileIcon;
  bool showLoading;
  CustomScreen({
    super.key,
    required this.title,
    required this.body,
    this.removeBack = false,
    this.removeProfileIcon = false,
    this.showLoading = false,
  });

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: getAppBar(context),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/child.jpeg',
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.5),
          ),
          widget.body,
          widget.showLoading ? CustomLoadingIndicator() : const SizedBox(),
        ],
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorOrange,
      elevation: 0,
      title: CustomShadowText(
        text: widget.title,
        fontSize: 25,
        shadowColor: Colors.red,
        textColor: Colors.white,
      ),
      toolbarHeight: 60,
      centerTitle: true,
      actions: [
        widget.removeProfileIcon
            ? Container()
            : SizedBox(
                height: 40,
                width: 60,
                child: CustomInkwell(
                  onTap: () {
                    showProfileDialog(context);
                  },
                  child: const Center(
                      child: Icon(
                    CupertinoIcons.person,
                    size: 30,
                  )),
                ),
              ),
      ],
      leading: widget.removeBack
          ? Container()
          : SizedBox(
              height: 40,
              width: 40,
              child: CustomInkwell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                    child: Icon(
                  context.locale == const Locale('ar')
                      ? CupertinoIcons.chevron_right
                      : CupertinoIcons.chevron_left,
                  size: 30,
                )),
              ),
            ),
    );
  }
}
