import 'package:envairo/models/position.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class User {
  static const String defaultPicture =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

  final String email;
  final String username, name;
  final String? surname;
  final String picture;
  final double? reputation;
  final int? reviewCount;

  final Position? position;

  const User(
      {required this.email,
      required this.username,
      required this.name,
      this.picture = User.defaultPicture,
      this.surname,
      this.position,
      this.reputation,
      this.reviewCount});

  static List<User> generateFake(int number) {
    return List<int>.generate(number, (i) => i + 1)
        .map((int i) => User(
            email: faker.internet.email(),
            username: faker.internet.userName(),
            name: faker.person.name()))
        .toList();
  }

  static List<User> generatePlaceholders() {
    return [
      const User(
          email: "john.doe@mail.com",
          username: "john_doe",
          name: "John Doe",
          // picture: "",
          reputation: 4.7,
          reviewCount: 19),
      const User(
          email: "gilda.jeffry@mail.com",
          username: "gilda_jeffry",
          name: "Gilda",
          // picture: "",
          reputation: 4.2,
          reviewCount: 5),
      const User(
          email: "maureen.mertz@mail.com",
          username: "maureen_mertz",
          name: "Maureen",
          // picture: "",
          reputation: 4.5,
          reviewCount: 82),
      const User(
          email: "favian.hertha@mail.com",
          username: "favian_hertha",
          name: "Favian",
          // picture: "",
          reputation: 3.9,
          reviewCount: 21),
      const User(
          email: "reva.bauch@mail.com",
          username: "reva_bauch",
          name: "Reva",
          // picture: "",
          reputation: 4.9,
          reviewCount: 11),
      const User(
          email: "trycia.ernser@mail.com",
          username: "trycia_ernser",
          name: "Trycia",
          // picture: "",
          reputation: 4.2,
          reviewCount: 2),
    ];
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
      position: Position.fromJson(json['position']),
    );
  }
}
