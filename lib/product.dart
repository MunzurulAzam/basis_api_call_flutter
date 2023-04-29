import 'package:flutter/material.dart';
import 'dart:convert';

class Product {
  String id;
  String bannerName;
  // String bannerImage;
  // String webImage;
  // String type;
  // bool deleted;
  // int bannerPosition;
  // String? actionLink;

  Product({
    required this.id,
    required this.bannerName,
    // required this.bannerImage,
    // required this.webImage,
    // required this.type,
    // required this.deleted,
    // required this.bannerPosition,
    // this.actionLink,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    bannerName: json["bannerName"],
    // bannerImage: json["bannerImage"],
    // webImage: json["webImage"],
    // type: json["type"],
    // deleted: json["deleted"],
    // bannerPosition: json["bannerPosition"],
    // actionLink: json["actionLink"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bannerName": bannerName,
    // "bannerImage": bannerImage,
    // "webImage": webImage,
    // "type": type,
    // "deleted": deleted,
    // "bannerPosition": bannerPosition,
    // "actionLink": actionLink,
  };
}
