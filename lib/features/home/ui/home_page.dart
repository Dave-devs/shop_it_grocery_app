import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/features/search/ui/search_page.dart';
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
          padding: EdgeInsets.all(0.w),
          child: CustomTextField(
            width: 270.w,
            height: 35.h,
            controller: search,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage())
              );
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 18.sp,//18, FontWeight.w500, AppColors.kGrey,
              fontWeight: FontWeight.normal,
              color: AppColors.kGrey,
              overflow: TextOverflow.fade
            ),
            hintText: 'Search...',
            hintStyle: appStyle(14, FontWeight.w500, AppColors.kGrey, null),
            prefixIcon: Icon(Icons.search, color: AppColors.kGrey,),
            showCursor: true,
            cursorColor: AppColors.kGrey,
            border: Border.all(color: AppColors.kItemContainerColor),
            obscureText: false,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                badges.Badge(
                  onTap: () { },
                  position: badges.BadgePosition.topEnd(end: -2),
                  showBadge: true,
                  badgeContent: ReusableText(text: "0", style: appStyle(14, FontWeight.w400, AppColors.kWhiteText, null),),
                  badgeStyle: badges.BadgeStyle(badgeColor: AppColors.kRed,),
                  badgeAnimation: const badges.BadgeAnimation.fade(animationDuration: Duration(microseconds: 400)),
                  child: IconButton(onPressed: () { }, icon: Icon(Icons.favorite_outline_rounded, color: AppColors.kGrey, size: 18,)),
                ),
                badges.Badge(
                  onTap: () { },
                  position: badges.BadgePosition.topEnd(end: -2),
                  showBadge: true,
                  badgeContent: ReusableText(text: "0", style: appStyle(14, FontWeight.w400, AppColors.kWhiteText, null),),
                  badgeStyle: badges.BadgeStyle(badgeColor: AppColors.kRed,),
                  badgeAnimation: const badges.BadgeAnimation.fade(animationDuration: Duration(microseconds: 400)),
                  child: IconButton(onPressed: () { }, icon: Icon(Icons.shopping_cart_outlined, color: AppColors.kGrey, size: 18,)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
