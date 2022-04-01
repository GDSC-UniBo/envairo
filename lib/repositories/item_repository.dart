import '../models/advertisement.dart';
import '../models/user.dart';

class ItemRepository{

  List<Item> getUserItems(User user){
    return Item.generatePlaceholders().where(
            (Item element) => element.seller == user
    ).toList();
  }

  int countUserItems(User user) => getUserItems(user).length;
}