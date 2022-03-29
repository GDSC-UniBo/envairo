import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Advertisement> advs = [];
    return Column(children: [
      TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search products",
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.sh),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          contentPadding: EdgeInsets.fromLTRB(30.0.w, 29.0.w, 30.0.w, 29.0.w),
        ),
      ),
      Expanded(
        child: AdvertisementGrid(advs: advs),
      ),
    ]);
  }
}
