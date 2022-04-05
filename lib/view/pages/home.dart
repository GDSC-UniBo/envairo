import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/advertisement.dart';
import 'item_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          "assets/images/logo.png",
          width: 150.0,
          height: 100.0,
        ),
        Expanded(
          child: ItemGrid(items: Item.generatePlaceholders()),
        ),
      ]),
    );
  }
}
