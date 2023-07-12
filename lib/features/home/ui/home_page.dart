import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import '../../../common/widgets/custom_textfield.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.all(2.w),
          child: CustomTextField(
            width: 240.w,
            height: 40.h,
            controller: search,
            onChanged: (value) {
              //Implement a search function here
            },
            keyboardType: TextInputType.text,
            style: appStyle(18, FontWeight.w500, AppColors.kBlackText, null),
            hintText: 'Search...',
            hintStyle: appStyle(14, FontWeight.w500, AppColors.kGrey, null),
            prefixIcon: Icon(Icons.search, color: AppColors.kGrey,),
            showCursor: true,
            cursorColor: AppColors.kGrey,
            border: Border.all(color: AppColors.kItemContainerColor),
          ),
        ),
        actions: [
          // badges.Badge(
          //   position: badges.BadgePosition.topEnd(),
          //   showBadge: true,
          //   ignorePointer: false,
          //   onTap: () {},
          //   badgeContent: Icon(
          //     Icons.person_outline_rounded,
          //     color: AppColors.kWhiteText,
          //   ),
          //   badgeAnimation: const badges.BadgeAnimation.fade(
          //       animationDuration: Duration(microseconds: 400)),
          //   badgeStyle: badges.BadgeStyle(
          //     shape: badges.BadgeShape.square,
          //     badgeColor: AppColors.kRed,
          //     padding: EdgeInsets.all(5.w),
          //     borderRadius: BorderRadius.circular(4),
          //     elevation: 0,
          //   ),
          //   child: const ReusableText(text: '0'),
          // ),
          IconButton(onPressed: () { }, icon: Icon(Icons.message_outlined, color: AppColors.kGrey, size: 18,)),
          IconButton(onPressed: () {},  icon: Icon(Icons.person_outline_rounded, color: AppColors.kGrey, size: 18,)),
        ],
      ),
    );
  }
}
