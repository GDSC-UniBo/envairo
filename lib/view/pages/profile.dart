import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:envairo/view/widgets/custom_card.dart';
import 'package:envairo/view/widgets/custom_rating_bar.dart';
import 'package:envairo/view/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  final User user;

  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPersonalProfile = (user == User.generatePlaceholders()[0]);

    List<Advertisement> advs = Advertisement.generatePlaceholders()
        .where((Advertisement element) => element.seller == user)
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
              child: Row(
            children: [
              ClipOval(
                child: Image.asset(
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
                            child:
                                CustomRatingBar(rating: user.reputation ?? 0),
                            flex: 7),
                        Expanded(
                            flex: 3,
                            child:
                                Text(user.reviewCount.toString() + " reviews"))
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
                  Text(user.email)
                ],
              ),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.location_pin)),
                  Text("Soundsvall, Sweden")
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
              !isPersonalProfile
                  ? Padding(
                      padding: const EdgeInsets.all(10),
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          )),
          AdvertisementGrid(
            advs: advs,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
