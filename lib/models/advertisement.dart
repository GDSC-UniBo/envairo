import 'package:envairo/models/user.dart';
import 'package:flutter/material.dart';

class Advertisement{
  final int id;
  final String title;
  final String description;
  final List<Image>? images;
  final DateTime? availabilityTime;
  final User seller;
  //Queue stuffs


  Advertisement({
    required this.id,
    required this.seller,
    required this.title,
    this.availabilityTime,
    this.description = "",
    this.images
  });


  factory Advertisement.fromJson(Map<String, dynamic> json){
    return Advertisement(
        id: json["id"],
        seller: User.fromJson(json['user']),
        title: json['title'],
        description: json["description"],
        availabilityTime: json["availabilityTime"],
        images: json['images']
    );
  }
}