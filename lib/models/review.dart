import 'package:envairo/models/user.dart';

class Review {
  final double rating;
  final User target;
  final User author;
  final String? text;

  const Review({
    required this.target,
    required this.author,
    required this.rating,
    this.text
  });

  static List<Review> generatePlaceholders() {
    List<User> users = User.generatePlaceholders();
    return [
      Review(
          target: users[0],
          author: users[1],
          rating: 5,
          text: "Super recommended"),
      Review(
          target: users[0],
          author: users[3],
          rating: 4.5,
          text: "Punctual and serious Giver"),
      Review(
          target: users[0],
          author: users[4],
          rating: 4.3,
          text: "All found as described"),
      Review(
          target: users[0],
          author: users[5],
          rating: 3.9,
          text: "Kind and generous person. Recommended"),
      Review(
          target: users[0], author: users[6], rating: 4.5, text: "Recommended"),
      Review(
          target: users[0],
          author: users[7],
          rating: 4,
          text: "Items are in good condition"),
      Review(
          target: users[0],
          author: users[8],
          rating: 5,
          text: "Perfect. Recommended"),
      Review(
          target: users[2],
          author: users[1],
          rating: 5,
          text: "The product was in perfect conditions"),
      Review(
          target: users[2],
          author: users[3],
          rating: 4,
          text: "The product was in perfect conditions"),
      Review(
          target: users[2],
          author: users[4],
          rating: 3,
          text: "Some problems with communicatin but everything was ok"),
    ];
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        target: json["target"],
        author: json["author"],
        rating: json["rating"],
        text: json["text"]
    );
  }
}
