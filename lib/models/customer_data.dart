// To parse this JSON data, do
//
//     final customerData = customerDataFromJson(jsonString);

import 'package:ecommerece_velocity_app/models/Customer.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

CustomerData customerDataFromJson(String str) => CustomerData.fromJson(json.decode(str));

String customerDataToJson(CustomerData data) => json.encode(data.toJson());

class CustomerData {
  CustomerData({
    required this.data,
  });

  Data data;

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}