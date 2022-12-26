import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/widgets/custom_inkwell.dart';
import 'package:majlaat/widgets/custom_shadow_container.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';

showProfileDialog(
  BuildContext context,
) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 50,
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        child: getDialogContent(),
      );
    },
  );
}

Container getDialogContent() {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShadowContainer(
          radius: 50,
          color: Colors.red,
          child: CustomInkwell(
            onTap: () {},
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              getProfile(),
              getProfile(),
              getProfile(),
            ],
          ),
        ),
      ],
    ),
  );
}

getProfile() {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: AppColors.colorOrange,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.person,
            size: 50,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomShadowText(text: 'MALIK'),
      )
    ],
  );
}
