import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/review.dart';
import '../widgets/custom_rating_bar.dart';

class Reviews extends StatelessWidget {
  final List<Review> reviews;

  const Reviews({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Text("This user has no reviews.");
    } else {
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _reviewLine(context, reviews[index]),
                  const Divider(
                    thickness: 0.8,
                  ),
                ],
              );
            }),
      );
    }
  }

  Widget _reviewLine(BuildContext context, Review review) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  width: 75.h,
                  height: 75.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.asset(review.author.picture).image),
                  ),
                ),
                Text(
                  review.author.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: CustomRatingBar(rating: review.rating)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(review.text ?? ""),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
