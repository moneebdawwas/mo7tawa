class LastEditedResponseModel {
  String? lastEdited;

  LastEditedResponseModel.fromJson(Map<String, dynamic> json) {
    lastEdited = json['last_edited']?.toString();
  }
}
