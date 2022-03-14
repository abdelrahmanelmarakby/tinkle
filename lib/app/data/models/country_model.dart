class CountryModel {
  List<Data>? data;
  bool? status;
  dynamic error;
  int? statusCode;

  CountryModel({this.data, this.status, this.error, this.statusCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    if (json["status"] is bool) this.status = json["status"];
    this.error = json["error"];
    if (json["statusCode"] is int) this.statusCode = json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    data["status"] = this.status;
    data["error"] = this.error;
    data["statusCode"] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  int? code;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.title, this.code, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["code"] is int) this.code = json["code"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["code"] = this.code;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
