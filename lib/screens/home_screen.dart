import 'package:flutter/material.dart';
import 'package:majlaat/providers/home_provider.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:majlaat/widgets/scrollable_items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      removeBack: true,
      title: 'الرئيسية',
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.isLoading && value.isFirstLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 30, top: 15),
              itemCount: value.homeDataResponseModel?.categories?.length,
              itemBuilder: ((context, index) {
                return CustomScrollableItems(
                  index: index,
                );
              }),
            );
          }
        },
      ),
    );
  }
}
