import 'dart:developer';

import 'package:envairo/view/pages/profile.dart';
import 'package:envairo/view/pages/reviews.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);
  static const List<String> labels = ["Profile", "Reviews"];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                log('TODO');
              },
            ),
            SizedBox(width: 10.w),
            const Expanded(child: Text("lorem.ipsum")),
            IconButton(
              icon: const Icon(CupertinoIcons.ellipsis_vertical),
              onPressed: () {
                log('TODO');
              },
            ),
          ]),
          const Expanded(
              child: ToggleTab(labels: labels, children: [
            Profile(),
            Reviews(),
          ]))
        ]));
  }
}
