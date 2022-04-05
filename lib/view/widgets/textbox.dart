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
  final int? maxLines;

  const MyTextBox(
      {Key? key,
      this.hintText,
      this.onSubmitted,
      this.onChange,
      this.keyboardType,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.controller,
      this.maxLines = 1})
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
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: hintText,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: false,
          //fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
