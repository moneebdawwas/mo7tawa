import 'package:majlaat/services/base_model.dart';

class HomeDataResponseModelCategoriesChapters extends BaseApiResponseModel {
  String? aspect;
  String? createdAt;
  String? date;
  String? lastUpdated;
  int? pageNumber;
  String? thumbnail;
  String? title;
  String? type;
  String? video;
  String? viewUrl;

  HomeDataResponseModelCategoriesChapters.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    aspect = json['aspect']?.toString();
    createdAt = json['createdAt']?.toString();
    date = json['date']?.toString();
    lastUpdated = json['lastUpdated']?.toString();
    pageNumber = json['pageNumber']?.toInt();
    thumbnail = json['thumbnail']?.toString();
    title = json['title']?.toString();
    type = json['type']?.toString();
    video = json['video']?.toString();
    viewUrl = json['viewUrl']?.toString();
  }
}

class HomeDataResponseModelCategories {
  String? name;
  List<HomeDataResponseModelCategoriesChapters?>? chapters;
  String? thumbnail;

  HomeDataResponseModelCategories({
    this.name,
    this.chapters,
    this.thumbnail,
  });
  HomeDataResponseModelCategories.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    if (json['chapters'] != null) {
      final v = json['chapters'];
      final arr0 = <HomeDataResponseModelCategoriesChapters>[];
      v.forEach((v) {
        arr0.add(HomeDataResponseModelCategoriesChapters.fromJson(v));
      });
      chapters = arr0;
    }
    thumbnail = json['thumbnail']?.toString();
  }
}

class HomeDataResponseModel extends BaseApiResponseModel {
  String? lastEdit;
  List<HomeDataResponseModelCategories?>? categories;

  HomeDataResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    lastEdit = json['lastEdit']?.toString();
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <HomeDataResponseModelCategories>[];
      v.forEach((v) {
        arr0.add(HomeDataResponseModelCategories.fromJson(v));
      });
      categories = arr0;
    }
  }
}
