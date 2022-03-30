import 'dart:developer';

import 'package:envairo/models/review.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/router.dart';
import 'package:envairo/src/authentication.dart';
import 'package:envairo/view/pages/login_or_signup.dart';
import 'package:envairo/view/pages/profile.dart';
import 'package:envairo/view/pages/reviews.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);
  static const List<String> labels = ["Profile", "Reviews"];

  @override
  Widget build(BuildContext context) {
    final User user = User(
        email: "test@test.com",
        username: "current_user",
        name: "John",
        reputation: 2.3,
        reviewCount: 232);

    final List<User> others = User.generateFake(5);

    final List<Review> reviews = [
      Review(target: user, author: others[0], rating: 3.5),
      Review(
          target: user,
          author: others[1],
          rating: 5,
          text: "The product was in perfect conditions"),
      Review(target: user, author: others[2], rating: 4),
      Review(target: user, author: others[3], rating: 4.5),
      Review(target: user, author: others[4], rating: 5),
    ];
    return Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            SizedBox(width: 10.w),
            Expanded(child: Text(user.name)),
            PopupMenuButton<String>(
              onSelected: (String click) {
                AuthenticationHelper().signOut();
                Navigator.pushReplacement(
                  context,
                  RouteGenerator().generateRoute(
                      const RouteSettings(name: LoginOrSignup.route)),
                );
              },
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ]),
          Expanded(
              child: ToggleTab(labels: labels, children: [
            Profile(
              user: user,
            ),
            Reviews(reviews: reviews),
          ]))
        ]));
  }
}
