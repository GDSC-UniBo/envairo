import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final Widget child;
  final Color buttonColor;
  final Color? borderColor;
  final void Function() onTap;

  const RoundButton({
    Key? key,
    required this.child,
    required this.buttonColor,
    this.borderColor,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 30.w),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor ?? buttonColor),
                borderRadius: BorderRadius.circular(1.sh),
                color: buttonColor),
            child: child),
      ),
    );
  }
}
