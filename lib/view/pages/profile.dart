import 'dart:developer';

import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:envairo/view/widgets/advertisement_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  static const double borderRadius = 50;
  static const placeholderImage =
      "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg";

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String placeholderImage =
        "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg";
    User u1 = User(email: "user@mail.com", name: "Mario", username: "user123");
    User u2 = User(email: "user@mail.com", name: "Luigi", username: "user456");
    User u3 =
        User(email: "user@mail.com", name: "Francesco", username: "user789");

    // TODO: Fetch from API
    List<Advertisement> advs = [
      Advertisement(id: 1, seller: u1, title: "Product 1"),
      Advertisement(id: 2, seller: u2, title: "Product 2"),
      Advertisement(id: 3, seller: u1, title: "Product 3"),
      Advertisement(id: 4, seller: u3, title: "Product 4"),
      Advertisement(id: 5, seller: u3, title: "Product 5"),
      Advertisement(id: 6, seller: u2, title: "Product 6"),
      Advertisement(id: 7, seller: u1, title: "Product 7"),
      Advertisement(id: 8, seller: u3, title: "Product 8"),
      Advertisement(id: 9, seller: u3, title: "Product 9"),
      Advertisement(id: 10, seller: u3, title: "Product 10"),
      Advertisement(id: 11, seller: u3, title: "Product 11"),
    ];

    return Container(
        child: Column(
      children: [
        Card(
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                CircleAvatar(
                  radius: borderRadius,
                  child: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: ClipOval(child: Image.network(placeholderImage)),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("lorem.ipsum"),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                )
              ],
            )),
        Card(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      //TODO: Is it possible to not replicate the same padding three times?
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.check_circle_outline)),
                        Text("E-mail, Google, Facebook")
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_pin)),
                        Text("Soundsvall, Sweden")
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.rss_feed)),
                        Text("3 follower, 5 follows")
                      ],
                    ),
                  ],
                ))),
        Card(
            child: Column(
          children: [
            Row(
              children: [
                Text(
                  advs.length.toString() + " advertisments",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(),
                ),
                TextButton(
                  child: Row(children: [
                    Icon(Icons.tune_outlined, color: Colors.blue),
                    Text("Filters", style: TextStyle(color: Colors.blue)),
                  ]),
                  onPressed: () {
                    log("Prova");
                  },
                ),
              ],
            ),
            //TODO: Fix errors
            // AdvertisementGrid()
          ],
        ))
      ],
    ));
  }
}
