import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/widgets/custom_inkwell.dart';
import 'package:majlaat/widgets/custom_shadow_container.dart';
import 'package:majlaat/widgets/filled_button.dart';

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
        insetPadding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 5),
                      itemCount: 3,
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        if (index != 0) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2, color: AppColors.colorOrange)),
                          );
                        } else {
                          return SizedBox(
                            height: 90,
                            width: 90,
                            child: CustomShadowContainer(
                              color: Colors.red,
                              padding: EdgeInsets.all(3),
                              child: CustomInkwell(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          );
                        }
                      })),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
