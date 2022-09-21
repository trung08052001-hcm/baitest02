import 'package:flutter/material.dart';

class shoes {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;

  shoes({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
  });
  shoes.formJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
}
