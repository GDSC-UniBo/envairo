import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'notification_list.dart';

class Messages extends StatelessWidget{
  static const List<String> labels = ["Messages", "Notifications"];
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ToggleTab(
        labels: labels,
        children: [
          ChatList(),
          NotificationList(),
        ]
    );
  }
}