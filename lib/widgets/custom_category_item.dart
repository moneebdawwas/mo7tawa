import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/screens/pdf_screen.dart';
import 'package:majlaat/screens/story_screen.dart';
import 'package:majlaat/screens/video_screen.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';
import 'custom_inkwell.dart';

class CustomCategoryItem extends StatefulWidget {
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
  State<CustomCategoryItem> createState() => _CustomCategoryItemState();
}

class _CustomCategoryItemState extends State<CustomCategoryItem> {
  String type = '';
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomInkwell(
          borderRadius: 0,
          onTap: () {
            setState(() {
              type = widget.type;
              url = widget.url;
              onTapItemAction();
            });
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
                imageUrl: widget.thumbnail,
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
          text: widget.title,
          shadowColor: Colors.black,
          textColor: Colors.red.shade400,
          fontSize: 18,
        )
      ],
    );
  }

  onTapItemAction() {
    if (type == 'story') {
      CustomNavigator.push(context, page: StroyScreen(url: url));
    } else if (type == 'video') {
      CustomNavigator.push(context, page: VideoScreen(videoUrl: url));
    } else if (type == 'pdf') {
      CustomNavigator.push(context, page: PdfScreen(url: url));
    }
  }
}
