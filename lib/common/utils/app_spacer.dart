import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  final double width;
  const WidthSpacer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}

class HeightSpacer extends StatelessWidget {
  final double height;
  const HeightSpacer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}