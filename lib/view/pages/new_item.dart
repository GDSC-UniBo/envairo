import 'package:envairo/view/widgets/round_button.dart';
import 'package:envairo/view/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewItem extends StatelessWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _uploadPhoto(context),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
          _titleDescription(context),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
          _otherFields(context),
        ],
      ),
    );
  }

  Widget _uploadPhoto(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 110.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.h),
            bottomRight: Radius.circular(70.h)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text("New advertisement",
            style: Theme.of(context).textTheme.headline5,
          ),

          Container(padding: EdgeInsets.symmetric(vertical: 40.h)),

          SizedBox(
            width: 300.w,
            child: RoundButton(
              buttonColor: Theme.of(context).secondaryHeaderColor,
              onTap: () {},
              child: Row(
                  children: [
                    const Icon(Icons.add),
                    Text("Upload photo",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(70.h)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10.h, left: 40.w),
            child: Text("Title",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const MyTextBox(
            hintText: "Type a title for the advertisement",
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 40.h, left: 40.w),
            child: Text("Description",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const MyTextBox(
            hintText: "Type a description for the advertisement",
            maxLines: null,
          ),
        ],
      ),
    );
  }

  Widget _otherFields(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70.h), topRight: Radius.circular(70.h)),
        color: Colors.white,
      ),
      child: Column(
          children: [
            _otherField(
              context: context,
              name: "Location",
            ),

            const Divider(thickness: 0.8),

            _otherField(
              context: context,
              name: "Time of picking up",
            ),

            const Divider(thickness: 0.8),

            _otherField(
              context: context,
              name: "More...",
            ),
          ]
      ),
    );
  }

  Widget _otherField({required BuildContext context, required String name}) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Row(
        children: [
          Text(name,
            style: Theme.of(context).textTheme.headline6,
          ),

          const Expanded(child: SizedBox()),

          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right)
          ),
        ],
      ),
    );
  }
}
