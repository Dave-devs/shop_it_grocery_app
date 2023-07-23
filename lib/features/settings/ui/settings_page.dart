import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_spacer.dart';
import '../../../common/widgets/reusable_text.dart';
import '../widgets/about_shopit_tile.dart';
import '../widgets/app_info.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: ReusableText(
            text: 'Help',
            style: appStyle(20, FontWeight.bold, AppColors.kWhiteText, null)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: AppColors.kWhiteText,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.kWhiteText,
              )),
        ],
      ),
      body: ListView(
        children: [
          HeightSpacer(height: 20.h),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.feedback,
                  color: AppColors.kWhiteText,
                  size: 20,
                ),
                const WidthSpacer(width: 5),
                ReusableText(
                    text: 'START LIVE CHAT',
                    style: appStyle(
                        16, FontWeight.w500, AppColors.kWhiteText, null)),
              ],
            ),
          ),
          HeightSpacer(height: 10.h),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
              child: ReusableText(
                text: 'ABOUT SHOP-IT',
                style: appStyle(15, FontWeight.w500, AppColors.kGrey, null),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kWhiteText,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    AboutShopITTile(
                      text: 'SHOP-IT Services',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                    AboutShopITTile(
                      text: 'FAQ',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                    AboutShopITTile(
                      text: 'Privacy Policy',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: ReusableText(
                text: 'SETTINGS',
                style: appStyle(15, FontWeight.w500, AppColors.kGrey, null),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kWhiteText,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    SettingsTile(
                        text: 'SHOP-IT Services',
                        widget: Switch(
                          activeColor: AppColors.kPrimaryAccentColor,
                          value: value,
                          onChanged: (bool newValue) {
                            setState(() {
                              value = newValue;
                            });
                          },
                        )),
                    SettingsTile(
                      text: 'FAQ',
                      widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                    SettingsTile(
                      text: 'Language',
                      widget: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ReusableText(
                          text: 'ENGLISH',
                          style: appStyle(
                              14, FontWeight.w500, AppColors.kGrey, null),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
              child: ReusableText(
                text: 'APP INFO',
                style: appStyle(15, FontWeight.w500, AppColors.kGrey, null),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kWhiteText,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    AppInfoTile(
                      text: 'App Version 12.0.1',
                      widget: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ReusableText(
                          text: 'UP TO DATE',
                          style: appStyle(14, FontWeight.w500, AppColors.kGrey, null),
                        ),
                      ),
                    ),
                    HeightSpacer(height: 20.h),
                    AppInfoTile(
                      text: 'Cache Used: 40.80 KB',
                      widget: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ReusableText(
                            text: 'CLEAR',
                            style: appStyle(
                                14, FontWeight.w500, AppColors.kGrey, null),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
