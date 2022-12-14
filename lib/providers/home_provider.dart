import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:majlaat/models/home_data_model.dart';
import 'package:majlaat/models/last_edited_model.dart';
import 'package:majlaat/providers/base_provider.dart';

import 'package:http/http.dart' as http;
import 'package:majlaat/widgets/custom_navigation_bar.dart';
import 'package:majlaat/widgets/custom_navigator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends BaseProvider {
  HomeDataResponseModel? homeDataResponseModel;

  Future getHomeData(BuildContext context) async {
    getLastUpdateDate();
    String fileName = 'homedata.json';
    var directory = await getTemporaryDirectory();
    File file = new File(directory.path + '/' + fileName);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (file.existsSync()) {
      var jsonData = file.readAsStringSync();
      log('Loading from cache  \n\n    ${jsonData} ');

      HomeDataResponseModel responseModel =
          HomeDataResponseModel.fromJson(jsonDecode(jsonData));

      homeDataResponseModel = responseModel;
      notifyListeners();

      CustomNavigator.push(context, page: CustomNavigationBar());

      return jsonDecode(jsonData);
    } else {
      homeDataRequest(context);
    }
  }

  homeDataRequest(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fileName = 'homedata.json';
    var directory = await getTemporaryDirectory();
    File file = new File(directory.path + '/' + fileName);
    setLoading(true);
    log('Loading from API');

    String url =
        'https://dash.schoolmagazine.app/chapters/categories/624721e5876f5556896a572b?fbclid=IwAR0m-kbJEYWJqS6ILErjGrOB_PLzU55YfI8avuKuC4TVKljV9GrOBp9R6sg';

    var response = await http.get(
      Uri.parse(url),
    );

    log('response'
        '\nstatus code: ${response.statusCode.toString()}'
        '\nbody:\n${response.body}');

    HomeDataResponseModel responseModel =
        HomeDataResponseModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      homeDataResponseModel = responseModel;
      prefs.setString('lastEditedOld', responseModel.lastEdited.toString());

      file.writeAsStringSync(response.body);
      notifyListeners();

      setLoading(false);
    } else {
      setLoading(false);

      return Exception();
    }

    return jsonDecode(response.body);
  }

  Future getLastUpdateDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url =
        'https://dash.schoolmagazine.app/chapters/categories/624721e5876f5556896a572b/last-edited';

    var response = await http.get(
      Uri.parse(url),
    );

    log('response'
        '\nstatus code: ${response.statusCode.toString()}'
        '\nbody:\n${response.body}');

    LastEditedResponseModel responseModel =
        LastEditedResponseModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      prefs.setString('lastEditedNew', responseModel.lastEdited.toString());
    } else {
      setLoading(false);

      return Exception();
    }

    return jsonDecode(response.body);
  }
}
