import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/advertisement.dart';
import '../pages/item_details.dart';

class ItemCard extends StatelessWidget {
  static const double borderRadius = 20;

  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.h)),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ItemDetails.route, arguments: item),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Hero(
                  tag: item.mainImage + item.seller.name,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius.h),
                            topRight: Radius.circular(borderRadius.h)),
                        child:
                            Image.network(item.mainImage, fit: BoxFit.cover)),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5.h, left: 30.w, right:30.w),
                        width: double.maxFinite,
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: const Color.fromRGBO(61, 61, 61, 1),
                            fontFamily: "Shapiro",
                            fontSize: 36.sp,
                          ),
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
                            item.seller.picture,
                            height: 45.h,
                            width: 45.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item.seller.name,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
