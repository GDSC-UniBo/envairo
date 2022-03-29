import 'dart:math';

import 'package:envairo/models/user.dart';
import 'package:faker/faker.dart';
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

  static List<Advertisement> generateFake(int advNumber, int usersNumber) {
    List<User> users = User.generateFake(usersNumber);
    return List<int>.generate(advNumber, (i) => i + 1)
        .map((int i) => Advertisement(
            id: i,
            seller: users[Random().nextInt(users.length)],
            title: faker.vehicle.model(),
            mainImage: faker.image.image(random: true)))
        .toList();
  }

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
