import 'package:envairo/view/pages/chat_view.dart';
import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_or_signup.dart';

class ChatList extends StatelessWidget{
  static const double leadingSize = 95;

  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _chatRow(context,
            title: "Utente1",
            lastMessage: "Lorem ipsum bla blad sdsa test test long text test test",
            timeAgo: "2 giorni fa" ,
            profileImg: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
            advImage: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
          ),

          _chatRow(context,
            title: "Utente2",
            lastMessage: "Short last",
            timeAgo: "4 giorni fa" ,
            profileImg: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
            advImage: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
          ),
        ],
      ),
    );
  }

  Widget _chatRow(BuildContext context, {
    required String title,
    required String lastMessage,
    required String timeAgo,
    required String profileImg,
    required String advImage
  }){
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ChatView.route),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.network(profileImg,
                  height: leadingSize.h,
                  width: leadingSize.h,
                  fit: BoxFit.cover,
                ),
              ),

              title: Row(
                children: [
                  Text(title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),

                  Expanded(child: Container()),

                  Text(timeAgo,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),

              subtitle: Text(lastMessage,
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
                child: const Divider(thickness: 0.8)
            ),
          ]
      ),
    );
  }
}