import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:freebye/models/user.dart';

class Item {
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

  Item(
      {required this.id,
      required this.seller,
      required this.title,
      this.mainImage = Item.defaultImage,
      this.availabilityTime,
      this.description = "",
      this.images});

  static List<Item> generateFake(int advNumber, int usersNumber) {
    List<User> users = User.generateFake(usersNumber);
    return List<int>.generate(advNumber, (i) => i + 1)
        .map((int i) => Item(
            id: i,
            seller: users[Random().nextInt(users.length)],
            title: faker.vehicle.model(),
            mainImage: faker.image.image(random: true)))
        .toList();
  }

  static List<Item> generatePlaceholders() {
    List<User> users = User.generatePlaceholders();
    return [
      Item(
          id: 1,
          seller: users[0],
          title: "Dishwasher",
          description:
              "I am giving away my dishwasher! It has 8 years now, but it is still working (with some weird noise sometimes, but not too loud). If you want it reach me out in direct messages! I need to give it away before the 15th April.",
          mainImage: "https://i.imgur.com/H9LR3Bj.jpg"),
      Item(
          id: 2,
          seller: users[8],
          title: "iPhone 5",
          description:
              "My dear old iPhone 5. It stayed in my drawer for years, so I think it arrives the moment to give it away. Take care of it :)",
          mainImage:
              "https://i.ebayimg.com/images/g/09AAAOSw4V9a0TO4/s-l300.jpg"),
      Item(
          id: 3,
          seller: users[2],
          title: "Skateboard",
          description:
              "Skateboard in good condition. You can come this Saturday between 2.00 PM and 4.00 PM and take it.",
          mainImage:
              "https://webimg.secondhandapp.at/400x400/5dae046c892bcb0f93f19821"),
      Item(
          id: 4,
          seller: users[4],
          title: "White shoes, size 42",
          description:
              "They are almost new, it was a gift of a friend but I don't like them too much (sorry Kevin <3)",
          mainImage: "https://i.imgur.com/VPyrXw3.jpg"),
      Item(
          id: 5,
          seller: users[3],
          title: "Vacuum cleaner",
          description:
              "Dyson Vacuum cleaner bought 4-5 years ago, The cable is broken so it should be substituted, but it works.",
          mainImage: "https://i.imgur.com/y3I1uLH.jpg"),
      Item(
          id: 6,
          seller: users[1],
          title: "Wooden table",
          description:
              "I am moving to Dallas and I need to give away some furniture. You need to come before the 18th otherwise I will must throw it in thrash :(",
          mainImage: "https://i.imgur.com/BpfV3WH.jpg"),
      Item(
          id: 7,
          seller: users[4],
          title: "Old couch",
          description:
              "White couch with tongs. Please come with a van to take it away.",
          mainImage: "https://i.imgur.com/yoOmSdf.jpg"),
      Item(
          id: 8,
          seller: users[9],
          title: "Pink office chair",
          description:
              "Sadly I need to give it away becaus we renew our office, but I worked 8 hours per day for 6 years on this chair. It is super comfortable, I promise. ",
          mainImage: "https://i.imgur.com/2tb88rW.jpg"),
      Item(
          id: 9,
          seller: users[0],
          title: "Big closet",
          description:
              "I am changing mine closet, so I give this away. If you want more picture just ask me in the chat. I prefer to give it to someone with good rewards, thanks!",
          mainImage: "https://i.imgur.com/pCYnCf8.jpg"),
      // Advertisement(id: 10, seller: users[2], title: "", description: "", mainImage: ""),
      // Advertisement(id: 11, seller: users[0], title: "", description: "", mainImage: ""),
      // Advertisement(id: 12, seller: users[0], title: "", description: "", mainImage: ""),
    ];
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json["id"],
        seller: User.fromJson(json['user']),
        title: json['title'],
        description: json["description"],
        availabilityTime: json["availabilityTime"],
        images: json['images']);
  }
}
