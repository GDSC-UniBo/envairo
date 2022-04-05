import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freebye/view/pages/profile.dart';
import 'package:freebye/view/pages/reviews.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';
import '../../src/authentication.dart';
import '../widgets/toggle_tab.dart';
import 'login_or_signup.dart';

class MyProfile extends StatelessWidget {
  static const List<String> labels = ["Profile", "Reviews"];

  final User user = User.generatePlaceholders()[0];

  MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
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
                Navigator.pushReplacementNamed(context, LoginOrSignup.route);
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
            Reviews(
                reviews: RepositoryProvider.of<UserRepository>(context)
                    .getUserReviews(user)),
          ]))
        ]));
  }
}
