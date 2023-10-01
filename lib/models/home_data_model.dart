import 'package:majlaat/services/base_model.dart';

class HomeDataResponseModelCategoriesChapters {
  String? id;
  String? title;
  int? pageNumber;
  String? thumbnail;
  String? url;
  String? date;
  String? type;
  bool? isFavorite;

  HomeDataResponseModelCategoriesChapters({
    this.id,
    this.title,
    this.pageNumber,
    this.thumbnail,
    this.url,
    this.date,
    this.type,
    this.isFavorite,
  });
  HomeDataResponseModelCategoriesChapters.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    pageNumber = json['pageNumber']?.toInt();
    thumbnail = json['thumbnail']?.toString();
    url = json['url']?.toString();
    date = json['date']?.toString();
    type = json['type']?.toString();
    isFavorite = false;
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
  List<HomeDataResponseModelCategories?>? categories;
  String? lastEdited;

  HomeDataResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <HomeDataResponseModelCategories>[];
      v.forEach((v) {
        arr0.add(HomeDataResponseModelCategories.fromJson(v));
      });
      categories = arr0;
    }
    lastEdited = json['last_edited']?.toString();
  }
}
