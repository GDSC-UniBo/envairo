import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Advertisement> advs = Advertisement.generatePlaceholders();

    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          "assets/images/logo.png",
          width: 150.0,
          height: 100.0,
        ),
      ),
      Expanded(
        child: AdvertisementGrid(advs: advs),
      ),
    ]);
  }
}
