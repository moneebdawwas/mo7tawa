import 'package:flutter/material.dart';

import 'package:majlaat/providers/home_provider.dart';
import 'package:majlaat/widgets/custom_category_item.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:provider/provider.dart';

class ViewAllItemsScreen extends StatefulWidget {
  int index;

  ViewAllItemsScreen({
    super.key,
    required this.index,
  });

  @override
  State<ViewAllItemsScreen> createState() => _ViewAllItemsScreenState();
}

class _ViewAllItemsScreenState extends State<ViewAllItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return CustomScreen(
          title: value.homeDataResponseModel!.categories![widget.index]?.name ??
              '',
          body: getGridView(value),
        );
      },
    );
  }

  getGridView(HomeProvider value) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 15, right: 5, left: 5, bottom: 30),
      itemCount: value
          .homeDataResponseModel!.categories![widget.index]!.chapters!.length,
      itemBuilder: (context, index) {
        return CustomCategoryItem(
          thumbnail: value.homeDataResponseModel!.categories![widget.index]
                  ?.chapters?[index]?.thumbnail
                  .toString() ??
              '',
          type: value.homeDataResponseModel!.categories![widget.index]
                  ?.chapters?[index]?.type
                  .toString() ??
              '',
          url: value.homeDataResponseModel!.categories![widget.index]
                  ?.chapters?[index]?.viewUrl
                  .toString() ??
              '',
          title: value.homeDataResponseModel!.categories![widget.index]
                  ?.chapters?[index]?.title
                  .toString() ??
              '',
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
    );
  }
}
