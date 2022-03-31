import 'package:envairo/view/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/advertisement.dart';
import '../../models/user.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_rating_bar.dart';
import '../widgets/round_button.dart';
import 'chat_view.dart';

class AdvertisementDetails extends StatelessWidget {
  static const String route = '/adv-details';

  final Advertisement advertisement;

  const AdvertisementDetails({Key? key, required this.advertisement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User.generatePlaceholders().first;
    return Scaffold(
      body: Hero(
          tag: advertisement.mainImage + advertisement.seller.name,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildImage(),
                CustomCard(
                  child: Text(advertisement.description),
                ),
                CustomCard(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, UserProfile.route, arguments: advertisement.seller),
                          child: ClipOval(
                            child: Image.asset(
                              advertisement.seller.picture,
                              height: 100.h,
                              width: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(advertisement.seller.name),
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: CustomRatingBar(rating: 4), flex: 7
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text(advertisement.seller.reviewCount.toString() + " reviews")
                                  )
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
                            Text(advertisement.seller.email)
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
            ),
          )),
    );
  }

  Widget buildImage() => AspectRatio(
    aspectRatio: 1,
    child: Image.network(advertisement.mainImage, fit: BoxFit.cover),
  );
}