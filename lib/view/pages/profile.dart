import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:envairo/view/widgets/custom_card.dart';
import 'package:envairo/view/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  final User user;

  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPersonalProfile = true;

    List<Advertisement> advs = Advertisement.generateFake(20, 5);

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      user.picture,
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
                          child: Text(user.name),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: RatingBar.builder(
                                  initialRating: user.reputation ?? 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.1),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                flex: 7),
                            Expanded(
                                flex: 3,
                                child: Text(user.reviewCount.toString() + " reviews"))
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
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.check_circle_outline)),
                      Text(user.email)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.location_pin)),
                      Text("Soundsvall, Sweden")
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.rss_feed)),
                      Text("3 follower, 5 follows")
                    ],
                  ),
                  !isPersonalProfile
                      ? Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          RoundButton(
                            child: Text(
                              "Message",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            buttonColor: Colors.white,
                            borderColor: Theme.of(context).primaryColor,
                            onTap: () => {},
                          ),
                          SizedBox(width: 20),
                          RoundButton(
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            buttonColor: Theme.of(context).primaryColor,
                            onTap: () => {},
                          ),
                        ],
                      ))
                      : Container()
                ],
              )),
          CustomCard(
              child: Row(
                children: [
                  Text(
                    advs.length.toString() + " advertisments",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                    child: Row(children: const [
                      Icon(Icons.tune_outlined, color: Colors.blue),
                      Text("Filters", style: TextStyle(color: Colors.blue)),
                    ]),
                    onPressed: () {
                      //log("Prova");
                    },
                  ),
                ],
              )
          ),

          AdvertisementGrid(
            advs: advs,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
