import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Advertisement> advs = Advertisement.generatePlaceholders();

    return Container(
      padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          "assets/images/logo.png",
          width: 150.0,
          height: 100.0,
        ),
        Expanded(
          child: AdvertisementGrid(advs: advs),
        ),
      ]),
    );
  }
}
