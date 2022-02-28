import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleTab extends StatefulWidget {
  final List<String> labels;
  final List<Widget> children;

  const ToggleTab({
    Key? key,
    required this.labels,
    required this.children
  }) : super(key: key);

  @override
  _ToggleTabState createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> with SingleTickerProviderStateMixin{
  static const int height = 85;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.labels.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height.h),
            ),
            child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(height.h)),
                    color: Theme.of(context).primaryColor
                ),
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodyText1,
                unselectedLabelColor: Colors.grey,
                tabs: widget.labels.map((e) =>
                    Tab(text: e)
                ).toList()
            ),

          ),
        ),

        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: widget.children
          ),
        ),
      ],
    );
  }
}