import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatelessWidget {
  static const double leadingSize = 95;

  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = User.generatePlaceholders();
    List<Advertisement> advs = Advertisement.generatePlaceholders();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          //TODO
        },
      ),
      body: Column(
        children: [
          _chatRow(
            context,
            title: users[2].name,
            lastMessage: "Hey, when will you be able to collect the item?",
            timeAgo: "2 minutes ago",
            profileImg: users[2].picture,
            advImage: advs[3].mainImage,
          ),
          _chatRow(
            context,
            title: users[3].name,
            lastMessage: "Thank you very much!!",
            timeAgo: "1 week ago",
            profileImg: users[3].picture,
            advImage: advs[5].mainImage,
          ),
        ],
      ),
    );
  }

  Widget _chatRow(BuildContext context,
      {required String title,
      required String lastMessage,
      required String timeAgo,
      required String profileImg,
      required String advImage}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ChatView.route),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          leading: ClipOval(
            child: Image.asset(
              profileImg,
              height: leadingSize.h,
              width: leadingSize.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Expanded(child: Container()),
              Text(
                timeAgo,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
          subtitle: Text(
            lastMessage,
            style: Theme.of(context).textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: leadingSize.h + 34),
          height: 50.h,
          width: 50.h,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.h)),
            child: Image.network(advImage, fit: BoxFit.cover),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: const Divider(thickness: 0.8)),
      ]),
    );
  }
}
