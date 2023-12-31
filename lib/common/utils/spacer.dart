// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({Key? key, required this.width,}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({Key? key, required this.height,}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: height);
  }
}
