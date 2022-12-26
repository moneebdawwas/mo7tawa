import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';
import 'package:majlaat/providers/home_provider.dart';

import 'package:majlaat/widgets/custom_screen.dart';
import 'package:majlaat/widgets/custom_shadow_text.dart';
import 'package:provider/provider.dart';

class CategorisScreen extends StatefulWidget {
  const CategorisScreen({super.key});

  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        title: 'التصنيفات',
        removeBack: true,
        body: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return getPageBody(value);
          },
        )

        //
        );
  }

  ListView getPageBody(HomeProvider homeProvider) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      itemCount: homeProvider.homeDataResponseModel?.categories?.length ?? 0,
      separatorBuilder: ((context, index) => SizedBox(height: 30)),
      itemBuilder: ((context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.colorOrange, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 220,
                  imageUrl: homeProvider.homeDataResponseModel
                          ?.categories?[index]?.thumbnail ??
                      '',
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
            CustomShadowText(
              text: homeProvider
                      .homeDataResponseModel?.categories?[index]?.name ??
                  'No Name',
              fontSize: 25,
              shadowColor: Colors.black,
              textColor: Colors.white,
            )
          ],
        );
      }),
    );
  }
}
