import 'dart:convert';

import 'package:ecommerece_velocity_app/models/products.dart';

SingleProduct productFromJson(String str) => SingleProduct.fromJson(json.decode(str));

String productToJson(SingleProduct data) => json.encode(data.toJson());

class SingleProduct {
  SingleProduct({
    required this.data,
  });

  Product data;

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
    data: Product.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}
