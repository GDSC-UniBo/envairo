import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisementCard extends StatelessWidget {
  static const double borderRadius = 20;

  final String imageUrl, title;
  final String sellerImage, sellerName;
  final Advertisement advertisement;

  const AdvertisementCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.sellerImage,
      required this.sellerName,
      required this.advertisement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.h)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AdvertisementDetails.route, arguments: this),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: imageUrl + sellerName,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius.h),
                            topRight: Radius.circular(borderRadius.h)),
                        child: Image.network(imageUrl, fit: BoxFit.cover)),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
                    width: double.maxFinite,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    leading: ClipOval(
                      child: Image.asset(
                        sellerImage,
                        height: 55.h,
                        width: 55.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      sellerName,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )),
            ],
          ),
        )
    );
  }
}
