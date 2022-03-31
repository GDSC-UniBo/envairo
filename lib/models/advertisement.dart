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

  static List<Advertisement> generatePlaceholders() {
    List<User> users = User.generatePlaceholders();
    return [
      Advertisement(
          id: 1,
          seller: users[0],
          title: "Dishwasher",
          description: "",
          mainImage: "https://i.imgur.com/H9LR3Bj.jpg"),
      Advertisement(
          id: 2,
          seller: users[8],
          title: "iPhone 5",
          description: "",
          mainImage:
              "https://i.ebayimg.com/images/g/09AAAOSw4V9a0TO4/s-l300.jpg"),
      Advertisement(
          id: 3,
          seller: users[2],
          title: "Skateboard",
          description: "",
          mainImage:
              "https://webimg.secondhandapp.at/400x400/5dae046c892bcb0f93f19821"),
      Advertisement(
          id: 4,
          seller: users[4],
          title: "White shoes, size 42",
          description: "",
          mainImage: "https://i.imgur.com/VPyrXw3.jpg"),
      Advertisement(
          id: 5,
          seller: users[3],
          title: "Vacuum cleaner",
          description: "",
          mainImage: "https://i.imgur.com/y3I1uLH.jpg"),
      Advertisement(
          id: 6,
          seller: users[1],
          title: "Wooden table",
          description: "",
          mainImage: "https://i.imgur.com/BpfV3WH.jpg"),
      Advertisement(
          id: 7,
          seller: users[4],
          title: "Old couch",
          description: "",
          mainImage: "https://i.imgur.com/yoOmSdf.jpg"),
      Advertisement(
          id: 8,
          seller: users[9],
          title: "Pink office chair",
          description: "",
          mainImage: "https://i.imgur.com/2tb88rW.jpg"),
      Advertisement(
          id: 9,
          seller: users[0],
          title: "Big closet",
          description: "",
          mainImage: "https://i.imgur.com/pCYnCf8.jpg"),
      // Advertisement(id: 10, seller: users[2], title: "", description: "", mainImage: ""),
      // Advertisement(id: 11, seller: users[0], title: "", description: "", mainImage: ""),
      // Advertisement(id: 12, seller: users[0], title: "", description: "", mainImage: ""),
    ];
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
