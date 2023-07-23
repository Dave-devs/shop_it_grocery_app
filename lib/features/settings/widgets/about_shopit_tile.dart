import 'package:flutter/material.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/reusable_text.dart';

class AboutShopITTile extends StatelessWidget {
  final String text;
  final IconButton icon;
  const AboutShopITTile({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              text: text,
              style: appStyle(16, FontWeight.w400, AppColors.kBlackText, null)),
            icon
          ],
        ));
  }
}
