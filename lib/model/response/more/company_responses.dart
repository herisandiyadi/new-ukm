// To parse this JSON data, do
//
//     final companyResponse = companyResponseFromJson(jsonString);

// import 'dart:convert';

// CompanyResponse companyResponseFromJson(String str) =>
//     CompanyResponse.fromJson(json.decode(str));

// String companyResponseToJson(CompanyResponse data) =>
//     json.encode(data.toJson());

class CompanyResponse {
  CompanyResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      CompanyResponse(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.npwp,
    required this.address,
    this.endTime,
  });

  int id;
  String name;
  String npwp;
  String address;
  dynamic endTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        npwp: json["npwp"],
        address: json["address"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "npwp": npwp,
        "address": address,
        "end_time": endTime,
      };
}
