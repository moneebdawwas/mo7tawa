import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:majlaat/helper/dp_helper.dart';
import 'package:majlaat/widgets/custom_category_item.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFilesScreen extends StatefulWidget {
  const MyFilesScreen({super.key});

  @override
  State<MyFilesScreen> createState() => _MyFilesScreenState();
}

class _MyFilesScreenState extends State<MyFilesScreen> {
  DpHelper helper = DpHelper();
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      removeBack: true,
      title: '',
      body: FutureBuilder(
          future: helper.allCategories(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 15, right: 5, left: 5, bottom: 30),
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCategoryItem(
                          thumbnail: snapshot.data?[index]['thumbnail'] ?? '',
                          type: snapshot.data?[index]['type'] ?? '',
                          url: snapshot.data?[index]['url'] ?? '',
                          title: snapshot.data?[index]['title'] ?? '',
                        ),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                helper.delete(snapshot.data?[index]['id']);
                              });
                            },
                            icon: Icon(Icons.delete))
                      ],
                    );
                  }));
            }
          })),
    );
  }
}
