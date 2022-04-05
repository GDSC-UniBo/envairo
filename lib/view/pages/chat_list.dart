import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/chat_view.dart';
import 'package:envairo/view/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatelessWidget {
  static const double leadingSize = 95;
  static const double listTileSize = 185;

  final List<Item> interestingItems = Item.generatePlaceholders();

  ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        onPressed: () {
          //TODO
        },
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _chatRow(
              context,
              title: interestingItems[index].seller.name,
              lastMessage: "Hey, when will you be able to collect the item?",
              timeAgo: "2 minutes ago",
              profileImg: interestingItems[index].seller.picture,
              advImage: interestingItems[index].mainImage,
            );
          },
        ),
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
          minVerticalPadding: 0,
          leading: GestureDetector(
              child: Container(
                width: leadingSize.h,
                height: leadingSize.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: Image.asset(profileImg).image),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, UserProfile.route)),
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
              ),
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
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0, bottom: 0.0),
          child: Divider(
            thickness: 0.8,
            height: 0.1,
          ),
        ),
      ]),
    );
  }
}
