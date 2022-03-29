import 'package:envairo/models/user.dart';
import 'package:flutter/material.dart';

class Advertisement {
  static const String defaultImage =
      "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg";

  final int id;
  final String title;
  final String description;
  final String mainImage;
  final List<Image>? images;
  final DateTime? availabilityTime;
  final User seller;
  //Queue stuffs

  Advertisement(
      {required this.id,
      required this.seller,
      required this.title,
      this.mainImage = Advertisement.defaultImage,
      this.availabilityTime,
      this.description = "",
      this.images});

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
        id: json["id"],
        seller: User.fromJson(json['user']),
        title: json['title'],
        description: json["description"],
        availabilityTime: json["availabilityTime"],
        images: json['images']);
  }
}
