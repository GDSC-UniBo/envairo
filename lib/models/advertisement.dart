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
          title: "Red couch",
          description: "",
          mainImage:
              "https://img.myloview.it/adesivi/home-interior-mock-up-with-red-sofa-table-and-decor-in-green-living-room-3d-render-700-238099544.jpg"),
      Advertisement(
          id: 2,
          seller: users[0],
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
          title: "Wheelchair",
          description: "",
          mainImage:
              "https://m.media-amazon.com/images/I/71+wkOufI+L._AC_SL1080_.jpg"),
      Advertisement(
          id: 5,
          seller: users[3],
          title: "Quilt",
          description: "",
          mainImage:
              "https://www.picclickimg.com/d/l400/pict/383714181288_/INDIAN-Handmade-Trapunta-vintage-Kantha-Copriletto-Buttare-Coperta.jpg"),
      Advertisement(
          id: 6,
          seller: users[1],
          title: "Stroller",
          description: "",
          mainImage:
              "https://i5.walmartimages.com/asr/9a1a6e22-687f-4b42-9bc9-4ecab825b631_2.65e6ef1a2ed52b0b848eb9c597fc9431.jpeg"),
      Advertisement(
          id: 7,
          seller: users[4],
          title: "Printer",
          description: "",
          mainImage:
              "https://images.officeworks.com.au/api/2/img/https://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_1000x1000/CATS3460BK_.jpg/resize?size=600&auth=MjA5OTcwODkwMg__"),
      Advertisement(
          id: 8,
          seller: users[4],
          title: "Broken PC",
          description: "",
          mainImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVn8SzI8Z4N-HQ0qJO4NmA0eArsl2hUPsaQ&usqp=CAU"),
      Advertisement(
          id: 9,
          seller: users[5],
          title: "Queen size bed",
          description: "",
          mainImage:
              "https://res.cloudinary.com/castlery/image/upload/w_1800,f_auto,q_auto/v1597221876/marketing/Cross-Market/blog/Buying%20the%20Right%20Bed%20Our%20Starter%20Guide%20to%20Bed%20Sizes%20and%20Styles%20/US/%2BImages/Blog%20Images/Blog_01_UGCQuentin.jpg"),
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
