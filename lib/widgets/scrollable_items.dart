import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/providers/home_provider.dart';
import 'package:majlaat/screens/view_all_items_screen.dart';
import 'package:majlaat/widgets/custom_category_item.dart';
import 'package:majlaat/widgets/custom_inkwell.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:majlaat/widgets/custom_shadow_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomScrollableItems extends StatefulWidget {
  int index;

  CustomScrollableItems({
    super.key,
    required this.index,
  });

  @override
  State<CustomScrollableItems> createState() => _CustomScrollableItemsState();
}

class _CustomScrollableItemsState extends State<CustomScrollableItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Column(
        children: [
          listTitleAndPlusIcon(context, value),
          SizedBox(height: 10),
          getListView(value),
        ],
      );
    });
  }

  getListView(HomeProvider value) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 20),
          itemCount: value.homeDataResponseModel?.categories?[widget.index]
                  ?.chapters?.length ??
              10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return CustomCategoryItem(
              thumbnail: value.homeDataResponseModel?.categories?[widget.index]
                      ?.chapters?[index]?.thumbnail ??
                  '',
              type: value.homeDataResponseModel?.categories?[widget.index]
                      ?.chapters?[index]?.type ??
                  '',
              url: value.homeDataResponseModel?.categories?[widget.index]
                      ?.chapters?[index]?.url ??
                  '',
              title: value.homeDataResponseModel?.categories?[widget.index]
                      ?.chapters?[index]?.title ??
                  '',
            );
          })),
    );
  }

  Row listTitleAndPlusIcon(BuildContext context, HomeProvider homeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomShadowContainer(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text(
            homeProvider
                    .homeDataResponseModel?.categories?[widget.index]?.name ??
                '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CustomShadowContainer(
          radius: 50,
          color: Colors.red,
          padding: EdgeInsets.all(3),
          child: CustomInkwell(
            onTap: () {
              CustomNavigator.push(context,
                  page: ViewAllItemsScreen(index: widget.index));
            },
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
