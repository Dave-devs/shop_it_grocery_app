import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_it_grocery_app/common/utils/app_spacer.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/reusable_text.dart';
import '../widgets/acct_item_tile.dart';
import '../widgets/settings_tile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: ReusableText(
                        text: 'Account',
                        style: appStyle(
                            20, FontWeight.bold, AppColors.kWhiteText, null))),
                const HeightSpacer(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ReusableText(
                      text: 'Welcome Davedevs!',
                      style: appStyle(20, FontWeight.w600,
                          AppColors.kPrimaryAccentColor, null)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: ReusableText(
                      text: 'davedevs@gmail.com',
                      style: appStyle(
                          14, FontWeight.w600, AppColors.kWhiteText, null)),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.infinite,
                              blurRadius: 3,
                              spreadRadius: 6,
                              color: AppColors.kGrey)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.wallet,
                            size: 24,
                            color: AppColors.kPrimaryColor,
                          ),
                          const WidthSpacer(width: 10),
                          ReusableText(
                            text: '\$1000.00',
                            style: appStyle(18, FontWeight.w500,
                                AppColors.kPrimaryColor, null),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
              child: ReusableText(
                text: 'MY SHOP-IT ACCOUNT',
                style: appStyle(15, FontWeight.w500, AppColors.kGrey, null),
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kWhiteText,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      AccountItemTileWidget(
                        icon1: Icons.local_shipping_outlined,
                        text: 'Orders',
                        width: 210,
                        icon2: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Ionicons.chevron_forward,
                              size: 16,
                            )),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.mail_outline,
                        text: 'Inbox',
                        width: 220,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.feedback_outlined,
                        text: 'Pending Reviews',
                        width: 120,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.local_activity_outlined,
                        text: 'Vouchers',
                        width: 189,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.favorite_outline,
                        text: 'Saved Items',
                        width: 163,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.store_outlined,
                        text: 'Follow Seller',
                        width: 160,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.history,
                        text: 'Recently Viewed',
                        width: 125,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                      AccountItemTileWidget(
                        icon1: Icons.youtube_searched_for_outlined,
                        text: 'Recently Searched',
                        width: 109,
                        icon2: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Ionicons.chevron_forward, size: 16)),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
              child: ReusableText(
                text: 'MY SETTINGS',
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
                    SettingsTileWidget(
                      text: 'Address Book',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                    SettingsTileWidget(
                      text: 'Account Management',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                    SettingsTileWidget(
                      text: 'Close Account',
                      icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_forward, size: 16)),
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: 'LOGOUT',
                      style: appStyle(18, FontWeight.w600, AppColors.kPrimaryColor, null),
                    ),
                    const WidthSpacer(width: 5),
                    Icon(
                      Icons.logout_outlined,
                      size: 16,
                      color: AppColors.kPrimaryColor,
                    )
                  ],
                ),
              )
            ),
          ],
      ),
    );
  }
}
