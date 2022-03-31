import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:envairo/view/widgets/custom_card.dart';
import 'package:envairo/view/widgets/custom_rating_bar.dart';
import 'package:envairo/view/widgets/round_button.dart';

class AdvertisementCard extends StatelessWidget {
  static const double borderRadius = 20;

  final String imageUrl, title;
  final String sellerImage, sellerName;
  final Advertisement advertisement;

  const AdvertisementCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.sellerImage,
      required this.sellerName,
      required this.advertisement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.h)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Screen2(item: this)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: imageUrl + sellerName,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius.h),
                            topRight: Radius.circular(borderRadius.h)),
                        child: Image.network(imageUrl, fit: BoxFit.cover)),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
                    width: double.maxFinite,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    leading: ClipOval(
                      child: Image.asset(
                        sellerImage,
                        height: 55.h,
                        width: 55.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      sellerName,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}

class Screen2 extends StatelessWidget {
  final AdvertisementCard item;

  const Screen2({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User.generatePlaceholders().first;
    return Scaffold(
      body: Hero(
          tag: item.imageUrl + item.sellerName,
          child: Column(
            children: [
              buildImage(),
              CustomCard(child: Text("hi there")),
              CustomCard(
                  child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      item.sellerImage,
                      height: 100.h,
                      width: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(item.sellerName),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomRatingBar(rating: 4), flex: 7),
                            Expanded(
                                flex: 3,
                                child: Text(item
                                        .advertisement.seller.reviewCount
                                        .toString() +
                                    " reviews"))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
              CustomCard(
                  child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.check_circle_outline)),
                      Text(item.advertisement.seller.email)
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.location_pin)),
                      Text("Bologna, Italy")
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.rss_feed)),
                      Text("3 follower, 5 follows")
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          RoundButton(
                            child: Text(
                              "Message",
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            buttonColor: Colors.white,
                            borderColor: Theme.of(context).secondaryHeaderColor,
                            onTap: () =>
                                Navigator.pushNamed(context, ChatView.route),
                          ),
                          const SizedBox(width: 20),
                          RoundButton(
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            buttonColor: Theme.of(context).secondaryHeaderColor,
                            onTap: () => {},
                          ),
                        ],
                      ))
                ],
              )),
            ],
          )),
    );
  }

  Widget buildImage() => AspectRatio(
        aspectRatio: 1,
        child: Image.network(item.imageUrl, fit: BoxFit.cover),
      );
}
