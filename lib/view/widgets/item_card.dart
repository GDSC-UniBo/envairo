import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  static const double borderRadius = 20;

  final Item item;

  const ItemCard({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.h)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AdvertisementDetails.route, arguments: item),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: item.mainImage + item.seller.name,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius.h),
                            topRight: Radius.circular(borderRadius.h)),
                        child: Image.network(item.mainImage, fit: BoxFit.cover)),
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
                        child: Text(item.title,
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
                          child: Image.asset(item.seller.picture,
                            height: 55.h,
                            width: 55.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.seller.name,
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
