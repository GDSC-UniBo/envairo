import 'package:faker/faker.dart';
import 'package:freebye/models/position.dart';

class User {
  static const String defaultPicture =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

  final String email;
  final String username, name;
  final String? surname;
  final String picture;
  final double reputation;
  final int reviewCount;

  final Position? position;

  const User({
    required this.email,
    required this.username,
    required this.name,
    this.picture = User.defaultPicture,
    this.surname,
    this.position,
    this.reputation = 0,
    this.reviewCount = 0,
  });

  static List<User> generateFake(int number) {
    return List<int>.generate(number, (i) => i + 1)
        .map((int i) => User(
              email: faker.internet.email(),
              username: faker.internet.userName(),
              name: faker.person.name(),
            ))
        .toList();
  }

  static List<User> generatePlaceholders() {
    return [
      const User(
          email: "john.doe@mail.com",
          username: "john_doe",
          name: "John Doe",
          picture: "assets/images/profile/user1.jpg",
          reputation: 4.7,
          reviewCount: 19),
      const User(
          email: "gilda.jeffry@mail.com",
          username: "gilda_jeffry",
          name: "Gilda",
          picture: "assets/images/profile/user2.jpg",
          reputation: 4.2,
          reviewCount: 5),
      const User(
          email: "maureen.mertz@mail.com",
          username: "maureen_mertz",
          name: "Maureen",
          picture: "assets/images/profile/user3.jpg",
          reputation: 4.5,
          reviewCount: 82),
      const User(
          email: "favian.hertha@mail.com",
          username: "favian_hertha",
          name: "Favian",
          picture: "assets/images/profile/user4.jpg",
          reputation: 3.9,
          reviewCount: 21),
      const User(
          email: "reva.bauch@mail.com",
          username: "reva_bauch",
          name: "Reva",
          picture: "assets/images/profile/user5.jpg",
          reputation: 4.9,
          reviewCount: 11),
      const User(
          email: "trycia.ernser@mail.com",
          username: "trycia_ernser",
          name: "Trycia",
          picture: "assets/images/profile/user6.jpg",
          reputation: 4.2,
          reviewCount: 2),
      const User(
          email: "robert.taylor@mail.com",
          username: "robert_taylor",
          name: "Robert",
          picture: "assets/images/profile/user7.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "natalie.lambert@mail.com",
          username: "natalie_lambert",
          name: "Natalie",
          picture: "assets/images/profile/user8.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "anthony.hernandez@mail.com",
          username: "anthony_hernandez",
          name: "Anthony",
          picture: "assets/images/profile/user9.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "clarence.solis@mail.com",
          username: "clarence_solis",
          name: "Clarence",
          picture: "assets/images/profile/user10.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "heidi.thomas@mail.com",
          username: "heidi_thomas",
          name: "Heidi",
          picture: "assets/images/profile/user11.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "kayla.clark@mail.com",
          username: "kayla_clark",
          name: "Kayla",
          picture: "assets/images/profile/user12.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "monica.hamilton@mail.com",
          username: "monica_hamilton",
          name: "Monica",
          picture: "assets/images/profile/user13.jpg",
          reputation: 0,
          reviewCount: 0),
      const User(
          email: "scott.jackson@mail.com",
          username: "scott_jackson",
          name: "Scott",
          picture: "assets/images/profile/user14.jpg",
          reputation: 0,
          reviewCount: 0),
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
