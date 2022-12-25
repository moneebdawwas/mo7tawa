import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/helper/dp_helper.dart';
import 'package:majlaat/models/my_files_model.dart';
import 'package:majlaat/screens/pdf_screen.dart';
import 'package:majlaat/screens/show_category_screen.dart';
import 'package:majlaat/screens/story_screen.dart';
import 'package:majlaat/screens/video_screen.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';
import 'custom_inkwell.dart';

class CustomCategoryItem extends StatelessWidget {
  String thumbnail;
  String type;
  String url;
  String title;
  CustomCategoryItem({
    super.key,
    required this.thumbnail,
    required this.type,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomInkwell(
          borderRadius: 0,
          onTap: () async {
            CustomNavigator.push(context,
                page: ShowCategoryScreen(
                  type: type,
                  url: url,
                  thumbnail: thumbnail,
                  title: title,
                ));
          },
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.colorOrange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                width: 130,
                height: 150,
                imageUrl: thumbnail,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      size: 50,
                    ),
                    Text('NO IMAGE')
                  ],
                ),
              )),
        ),
        SizedBox(height: 3),
        CustomShadowText(
          text: title,
          shadowColor: Colors.black,
          textColor: Colors.red.shade400,
          fontSize: 18,
        )
      ],
    );
  }
}
