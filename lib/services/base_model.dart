class BaseApiResponseModel {
  bool? isSuccess;
  String? message;
  List<Error?>? errors;

  BaseApiResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"];
    message = json["message"]?.toString();
    if (json["errors"] != null) {
      final v = json["errors"];
      final arr0 = <Error>[];
      v.forEach((v) {
        arr0.add(Error.fromJson(v));
      });
      errors = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["isSuccess"] = isSuccess;
    data["message"] = message;
    if (errors != null) {
      final v = errors;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["errors"] = arr0;
    }
    return data;
  }
}

class Error {
  int? code;
  String? description;
  String? descriptionAr;
  String? isoCode;

  String? getDescription(bool isArabic) {
    return isArabic ? descriptionAr : description;
  }

  Error.fromJson(Map<String, dynamic> json) {
    code = json["code"]?.toInt();
    description = json["description"]?.toString();
    descriptionAr = json["descriptionAr"]?.toString();
    isoCode = json["isoCode"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["description"] = description;
    data["descriptionAr"] = descriptionAr;
    data["isoCode"] = isoCode;
    return data;
  }
}
