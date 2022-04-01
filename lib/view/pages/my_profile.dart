import 'package:envairo/models/review.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/repositories/user_repository.dart';
import 'package:envairo/router.dart';
import 'package:envairo/src/authentication.dart';
import 'package:envairo/view/pages/login_or_signup.dart';
import 'package:envairo/view/pages/profile.dart';
import 'package:envairo/view/pages/reviews.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatelessWidget {
  static const List<String> labels = ["Profile", "Reviews"];

  final User user = User.generatePlaceholders()[0];

  MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
        child: Column(
            children: [
              Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                        child: Text(user.name)
                    ),

                    PopupMenuButton<String>(
                      onSelected: (String click) {
                        AuthenticationHelper().signOut();
                        Navigator.pushReplacementNamed(context,LoginOrSignup.route);
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
                  ]
              ),
              Expanded(
                  child: ToggleTab(
                      labels: labels,
                      children: [
                        Profile(
                          user: user,
                        ),
                        Reviews(
                            reviews: RepositoryProvider.of<UserRepository>(context).getUserReviews(user)
                        ),
                      ]
                  )
              )
            ]
        )
    );
  }
}
