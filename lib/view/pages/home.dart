import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Advertisement> advs = [];
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child:
            Text("Lorem Ipsum", style: Theme.of(context).textTheme.headline4),
      ),
      Expanded(
        child: AdvertisementGrid(advs: advs),
      ),
    ]);
  }
}
