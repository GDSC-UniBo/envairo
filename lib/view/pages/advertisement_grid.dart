import 'package:envairo/view/widgets/advertisement_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisementGrid extends StatelessWidget{
  const AdvertisementGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: 400.w,
      child: const AdvertisementCard(
          imageUrl: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
          title: "test",
          sellerImage: "https://www.artemedialab.it/wp-content/uploads/2019/04/immagini-sfondo-1-700x400.jpg",
          sellerName: "test"
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  
}