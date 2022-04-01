import 'package:envairo/models/advertisement.dart';
import 'package:envairo/view/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  final List<Item> items;
  final ScrollPhysics? physics;

  const ItemGrid({Key? key, required this.items, this.physics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: physics,
        crossAxisCount: 2,
        children: items.map((Item item) => ItemCard(item: item)).toList()
    );
  }
}
