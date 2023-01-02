import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/helper/dp_helper.dart';
import 'package:majlaat/screens/pdf_screen.dart';
import 'package:majlaat/screens/story_screen.dart';
import 'package:majlaat/screens/video_screen.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:majlaat/widgets/filled_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/my_files_model.dart';

class ShowCategoryScreen extends StatefulWidget {
  String thumbnail;
  String type;
  String url;
  String title;
  ShowCategoryScreen({
    super.key,
    required this.thumbnail,
    required this.type,
    required this.url,
    required this.title,
  });

  @override
  State<ShowCategoryScreen> createState() => _ShowCategoryScreenState();
}

class _ShowCategoryScreenState extends State<ShowCategoryScreen> {
  bool changeFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        title: widget.title,
        body: Column(
          children: [
            getImageAndButtons(context),
          ],
        ));
  }

  Padding getImageAndButtons(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.colorOrange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                width: 200,
                height: 220,
                imageUrl: widget.thumbnail,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text('NO IMAGE')
                  ],
                ),
              )),
          Spacer(),
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: FilledButton(
                      background: AppColors.colorOrange,
                      title: '',
                      onPressed: () async {
                        setState(() {
                          changeFavorite = !changeFavorite;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('favorite', changeFavorite);

                        if (changeFavorite) {
                          DpHelper helper = DpHelper();
                          MyFileModel model = MyFileModel({
                            'thumbnail': widget.thumbnail,
                            'type': widget.type,
                            'url': widget.url,
                            'title': widget.title,
                          });
                          int id = await helper.createCategories(model);
                        } else {}
                      },
                    ),
                  ),
                  Positioned(
                      top: 5,
                      bottom: 5,
                      right: 5,
                      left: 5,
                      child: Icon(
                        changeFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 80,
                height: 40,
                child: FilledButton(
                  background: AppColors.colorOrange,
                  title: 'عرض',
                  onPressed: () {
                    onTapItemAction(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  onTapItemAction(context) {
    if (widget.type == 'story') {
      CustomNavigator.push(context, page: StroyScreen(url: widget.url));
    } else if (widget.type == 'video') {
      CustomNavigator.push(context, page: VideoScreen(videoUrl: widget.url));
    } else if (widget.type == 'pdf') {
      CustomNavigator.push(context, page: PdfScreen(url: widget.url));
    }
  }
}
