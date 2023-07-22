import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/utils/app_spacer.dart';
import '../../../common/widgets/reusable_text.dart';

class AccountItemTileWidget extends StatelessWidget {
  final IconData icon1;
  final String text;
  final IconButton icon2;
  final double width;
  const AccountItemTileWidget({super.key, 
    required this.icon1, 
    required this.text, 
    required this.icon2, 
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(icon1, size: 24, color: AppColors.kPrimaryColor,),
          const WidthSpacer(width: 15),
          ReusableText(
            text: text,
            style: appStyle(16, FontWeight.w400, AppColors.kBlackText, null)
          ),
          WidthSpacer(width: width.sp),
          icon2
        ],
      )
    );
  }
}