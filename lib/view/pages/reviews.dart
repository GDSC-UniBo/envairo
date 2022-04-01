import 'package:envairo/view/widgets/custom_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:envairo/models/review.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final List<Review> reviews;

  const Reviews({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(reviews.isEmpty) {
      return const Text("This user has no reviews.");
    }
    else {
      return ListView.builder(
          itemBuilder: (context, index){
            return Column(
              children: [
                _reviewLine(context, reviews[index]),

                const Divider(
                  thickness: 0.8,
                ),
              ],
            );
          }
      );

    }
  }

  Widget _reviewLine(BuildContext context, Review review){
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(review.author.picture,
                  height: 75.h,
                  width: 75.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(review.author.name,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: CustomRatingBar(
                      rating: review.rating)
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(review.text ?? ""),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
