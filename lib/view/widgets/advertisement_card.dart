import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AdvertisementCard extends StatelessWidget{
  static const double borderRadius = 20;

  final String imageUrl, title;
  final String sellerImage, sellerName;

  const AdvertisementCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.sellerImage,
    required this.sellerName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.h)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius.h),
                  topRight: Radius.circular(borderRadius.h)
              ),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),

          Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    width: double.maxFinite,
                    child: Text(title,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    ),
                  ),

                  ListTile(
                    leading: ClipOval(
                      child: Image.network(sellerImage,
                        height: 55.h,
                        width: 55.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(sellerName,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}