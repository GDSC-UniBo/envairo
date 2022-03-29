import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/widgets/advertisement_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertisementGrid extends StatelessWidget {
  final List<Advertisement> advs;

  AdvertisementGrid({Key? key, required this.advs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: advs
            .map((Advertisement adv) => AdvertisementCard(
                imageUrl: adv.mainImage,
                title: adv.title,
                sellerImage: adv.seller.picture,
                sellerName: adv.seller.name))
            .toList());
  }
}
