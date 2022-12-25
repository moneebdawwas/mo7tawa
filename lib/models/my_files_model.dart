class MyFileModel {
  String? _thumbnail;
  String? _type;
  String? _url;
  String? _title;

  MyFileModel(dynamic obj) {
    _thumbnail = obj['thumbnail'];
    _type = obj['type'];
    _url = obj['url'];
    _title = obj['title'];
  }

  MyFileModel.fromjson(Map<String, dynamic> data) {
    _thumbnail = data['thumbnail'];
    _type = data['type'];
    _url = data['url'];
    _title = data['title'];
  }

  Map<String, dynamic> toJson() =>
      {'thumbnail': _thumbnail, 'type': _type, 'url': _url, 'title': _title};

  String get thumbnail => _thumbnail!;
  String get type => _type!;
  String get url => _url!;
  String get title => _title!;
}
