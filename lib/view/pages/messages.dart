import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_list.dart';
import 'notification_list.dart';

class Messages extends StatelessWidget{
  static const List<String> labels = ["Messages", "Notifications"];
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 75.h, left: 10.w, right: 10.w),
      child: ToggleTab(
          labels: labels,
          children: [
            ChatList(),
            const NotificationList(),
          ]
      ),
    );
  }
}