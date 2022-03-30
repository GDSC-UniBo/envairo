import 'package:envairo/models/review.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/profile.dart';
import 'package:envairo/view/pages/reviews.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatefulWidget {
  static const String route = "/profile/user";

  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static const List<String> labels = ["Profile", "Reviews"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = User.generatePlaceholders();
    final User user = users[2];

    final List<Review> reviews = Review.generatePlaceholders()
        .where((Review element) => element.target == user)
        .toList();
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 75.h, left: 25.w, right: 25.w),
          child: Column(children: [
            Expanded(
                child: ToggleTab(labels: labels, children: [
              Profile(
                user: users[2],
              ),
              Reviews(reviews: reviews),
            ]))
          ])),
    );
  }

  ChatTheme _getTheme() {
    return DefaultChatTheme(
      primaryColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      secondaryColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
