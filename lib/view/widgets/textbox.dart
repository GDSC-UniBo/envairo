import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextBox extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextAlign textAlign;
  final TextEditingController? controller;

  const MyTextBox(
      {Key? key,
      this.hintText,
      this.onSubmitted,
      this.onChange,
      this.keyboardType,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      child: TextField(
        controller: controller,
        textAlign: textAlign,
        onSubmitted: onSubmitted,
        onChanged: onChange,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}