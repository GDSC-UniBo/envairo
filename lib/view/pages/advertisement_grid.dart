import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/widgets/advertisement_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertisementGrid extends StatelessWidget {
  final List<Advertisement> advs;
  final ScrollPhysics? physics;

  const AdvertisementGrid({Key? key, required this.advs, this.physics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: physics,
        crossAxisCount: 2,
        children: advs
            .map((Advertisement adv) => AdvertisementCard(
                imageUrl: adv.mainImage,
                advertisement: adv,
                title: adv.title,
                sellerImage: adv.seller.picture,
                sellerName: adv.seller.name))
            .toList());
  }
}
