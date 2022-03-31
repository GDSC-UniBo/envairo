import 'package:envairo/models/review.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/profile.dart';
import 'package:envairo/view/pages/reviews.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  static const String route = "/profile/user";
  static const List<String> labels = ["Profile", "Reviews"];

  late final User user;

  final List<Review> reviews = Review.generatePlaceholders();

  UserProfile({Key? key, User? user}) : super(key: key){
    this.user = user?? User.generatePlaceholders()[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 75.h, left: 25.w, right: 25.w),
        child: Column(children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ]),
          Expanded(
            child: ToggleTab(labels: labels, children: [
              Profile(
                user: user,
              ),
              Reviews(
                  reviews: reviews
                      .where((Review element) => element.target == user)
                      .toList()),
            ]),
          ),
        ]),
      ),
    );
  }
}
