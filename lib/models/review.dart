import 'package:envairo/models/user.dart';

class Review {
  final double rating;
  final User target;
  final User author;
  final String? text;

  const Review(
      {required this.target,
      required this.author,
      required this.rating,
      this.text});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        target: json["target"],
        author: json["author"],
        rating: json["rating"],
        text: json["text"]);
  }
}
