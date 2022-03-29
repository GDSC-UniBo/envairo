import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          "assets/images/logo.png",
          width: 150.0,
          height: 100.0,
        ),
      ),
      const Expanded(
        child: AdvertisementGrid(),
      ),
    ]);
  }
}
