import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';
import 'package:envairo/view/widgets/advertisement_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertisementGrid extends StatelessWidget {
  const AdvertisementGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String placeholderImage =
        "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg";
    User u1 = User(email: "user@mail.com", name: "Mario", username: "user123");
    User u2 = User(email: "user@mail.com", name: "Luigi", username: "user456");
    User u3 =
    User(email: "user@mail.com", name: "Francesco", username: "user789");

    // TODO: Fetch from API
    List<Advertisement> advs = [
      Advertisement(id: 1, seller: u1, title: "Product 1"),
      Advertisement(id: 2, seller: u2, title: "Product 2"),
      Advertisement(id: 3, seller: u1, title: "Product 3"),
      Advertisement(id: 4, seller: u3, title: "Product 4"),
      Advertisement(id: 5, seller: u3, title: "Product 5"),
      Advertisement(id: 6, seller: u2, title: "Product 6"),
      Advertisement(id: 7, seller: u1, title: "Product 7"),
      Advertisement(id: 8, seller: u3, title: "Product 8"),
      Advertisement(id: 9, seller: u3, title: "Product 9"),
      Advertisement(id: 10, seller: u3, title: "Product 10"),
      Advertisement(id: 11, seller: u3, title: "Product 11"),
    ];
    return GridView.count(
        crossAxisCount: 2,
        children: advs.map((Advertisement x) => AdvertisementCard(
            imageUrl: placeholderImage,
            title: x.title,
            sellerImage: placeholderImage,
            sellerName: x.seller.name)
        ).toList()
    );
  }
}
