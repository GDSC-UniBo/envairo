import '../models/review.dart';
import '../models/user.dart';

class UserRepository{

  List<Review> getUserReviews(User user){
    return Review.generatePlaceholders().where(
            (Review element) => element.target == user
    ).toList();
  }
}