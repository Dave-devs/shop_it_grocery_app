import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color? buttonColor;
  final Widget widget;
  final String text;
  final EdgeInsetsGeometry padding;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.width,
    required this.height,
    this.buttonColor,
    required this.widget,
    required this.text,
    required this.padding
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius)),
        shape: BoxShape.rectangle
      ),
      child: Padding(
        padding: padding,
        child: widget
      )
    );
  }
}