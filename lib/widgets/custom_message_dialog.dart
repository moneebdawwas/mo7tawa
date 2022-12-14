import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';

showMessageDialog({
  required BuildContext context,
  required String? title,
  required String? message,
  required List<Widget>? actions,
  bool removeCloseBtn = false,
  bool wrongDialog = false,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomMessageDialog(
        title: title,
        message: message,
        actions: actions,
        removeCloseBtn: removeCloseBtn,
        wrongDialog: wrongDialog,
      );
    },
  );
}

class CustomMessageDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final List<Widget>? actions;

  final bool removeCloseBtn;
  final bool wrongDialog;

  CustomMessageDialog({
    Key? key,
    this.title,
    this.message,
    this.actions,
    this.removeCloseBtn = false,
    this.wrongDialog = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: wrongDialog
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                    size: 70,
                  ),
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: actions!,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                removeCloseBtn
                    ? Container()
                    : Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 15,
                            color: AppColors.colorOrange,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.colorOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            message!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.colorOrange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: actions!,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
