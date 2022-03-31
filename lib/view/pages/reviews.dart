import 'package:envairo/view/widgets/custom_rating_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:envairo/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  List<Review>? reviews;

  Reviews({Key? key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Review> rs = reviews ?? [];
    List<Widget> reviewRows = [];
    for (int i = 0; i < rs.length; i++) {
      Review r = rs[i];
      reviewRows.add(Row(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      r.author.picture,
                      height: 75.h,
                      width: 75.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    r.author.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: CustomRatingBar(rating: r.rating)),
                  Text(r.text ?? "")
                ],
              ))
        ],
      ));
      reviewRows.add(const Divider(
        thickness: 0.8,
      ));
    }
    return ListView(
        children: reviewRows.isNotEmpty
            ? reviewRows
            : [const Text("This user has no reviews.")]);
  }
}
