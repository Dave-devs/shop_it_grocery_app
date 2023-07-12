// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool? showCursor;
  final Color? cursorColor;
  final BoxBorder? border;
  const CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.keyboardType,
    this.style,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.showCursor,
    this.cursorColor,
    this.border,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius)),
        border: border
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        keyboardType: keyboardType,
        style: style,
        showCursor: showCursor,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.kRed, width: 0.5)
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.transparent, width: 0.5)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.kRed, width: 0.5)
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.kContainerColorGrey, width: 0.5)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 0.5)
          ),
        ),
      ),
    );
  }
}
