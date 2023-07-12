import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/common/utils/spacer.dart';
import 'package:pinput/pinput.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';

import '../../number_login/ui/phone_login_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: appStyle(16, FontWeight.bold, AppColors.kWhiteText, null),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrey),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius))
      )
  );final errorPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: appStyle(16, FontWeight.bold, AppColors.kWhiteText, null),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kRed),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius))
      )
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberLoginPage())
            );
          },
          icon: Icon(Icons.chevron_left_rounded, color: AppColors.kWhiteText,)
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.h,bottom: 20.h),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Image.asset('assets/onboarding/shop.png'),
              ),
              const HeightSpacer(height: 40),
              ReusableText(
                text: 'Input your OTP pin here',
                style: appStyle(16, FontWeight.bold, AppColors.kWhiteText, null),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  errorPinTheme: errorPinTheme,
                  length: 6,
                  showCursor: true,
                  onCompleted: (value) { 
                    if(value.length == 6) {
                      //Do something when hooked with Firebase
                    }
                  },
                  onSubmitted: (value) {
                    if(value.length == 6) {
                      //Do something when hooked with Fiebase
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}