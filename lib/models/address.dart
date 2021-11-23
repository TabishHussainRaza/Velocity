import 'dart:convert';

AddressList addressListFromJson(String str) {
  return AddressList.fromJson(json.decode(str));
}

String addressListToJson(AddressList data) => json.encode(data.toJson());

class AddressList {
  AddressList({
    required this.data,
  });

  List<Address> data;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    data: List<Address>.from(json["data"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.vatId,
    required this.address1,
    required this.country,
    required this.countryName,
    required this.state,
    required this.city,
    required this.postcode,
    required this.phone,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String companyName;
  String vatId;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  bool isDefault;
  DateTime createdAt;
  DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    companyName: json["company_name"],
    vatId: json["vat_id"],
    address1: List<String>.from(json["address1"].map((x) => x)),
    country: json["country"],
    countryName: json["country_name"],
    state: json["state"],
    city: json["city"],
    postcode: json["postcode"],
    phone: json["phone"],
    isDefault: json["is_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "company_name": companyName,
    "vat_id": vatId,
    "address1": List<dynamic>.from(address1.map((x) => x)),
    "country": country,
    "country_name": countryName,
    "state": state,
    "city": city,
    "postcode": postcode,
    "phone": phone,
    "is_default": isDefault,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

}

AddressData addressDataFromJson(String str) => AddressData.fromJson(json.decode(str));

String addressDataToJson(AddressData data) => json.encode(data.toJson());

class AddressData {
  AddressData({
    required this.data,
  });

  Data data;

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.vatId,
    required this.address1,
    required this.country,
    required this.countryName,
    required this.state,
    required this.city,
    required this.postcode,
    required this.phone,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String companyName;
  String vatId;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  bool isDefault;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    companyName: json["company_name"],
    vatId: json["vat_id"],
    address1: List<String>.from(json["address1"].map((x) => x)),
    country: json["country"],
    countryName: json["country_name"],
    state: json["state"],
    city: json["city"],
    postcode: json["postcode"],
    phone: json["phone"],
    isDefault: json["is_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "company_name": companyName,
    "vat_id": vatId,
    "address1": List<dynamic>.from(address1.map((x) => x)),
    "country": country,
    "country_name": countryName,
    "state": state,
    "city": city,
    "postcode": postcode,
    "phone": phone,
    "is_default": isDefault,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
