import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/common/utils/app_spacer.dart';
import 'package:shop_it_grocery_app/common/widgets/custom_botton.dart';
import 'package:shop_it_grocery_app/common/widgets/custom_textfield.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import '../../otp/ui/otp_page.dart';

class NumberLoginPage extends StatefulWidget {
  const NumberLoginPage({super.key});

  @override
  State<NumberLoginPage> createState() => _NumberLoginPageState();
}

class _NumberLoginPageState extends State<NumberLoginPage> {
  final TextEditingController phone = TextEditingController();
  Country country = Country(
    phoneCode: "234",
    countryCode: "NG",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "NGA",
    example: "NGA",
    displayName: "Nigeria",
    displayNameNoCountryCode: "NG",
    e164Key: ""
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 48.h),
        child: Column(children: [
          HeightSpacer(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Image.asset('assets/onboarding/shop.png'),
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ReusableText(
              text: 'Input your mobile number',
              style: appStyle(16, FontWeight.bold, AppColors.kWhiteText, null),
            ),
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: CustomTextField(
                width: 300.w,
                height: 50.h,
                controller: phone,
                style: appStyle(18, FontWeight.w500, AppColors.kWhiteText, null),
                border: Border.all(color: AppColors.kPrimaryColor),
                obscureText: false,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.w),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          textStyle: appStyle(16, FontWeight.w500, AppColors.kWhiteText, null),
                          searchTextStyle: appStyle(16, FontWeight.w500, AppColors.kWhiteText, null),
                          backgroundColor: AppColors.kPrimaryColor,
                          bottomSheetHeight: AppSize.kHeight * 0.4,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.kRadius),
                            topRight: Radius.circular(AppSize.kRadius)
                          )
                        ),
                        onSelect: (country) { 
                          setState(() {
                            
                          });
                         }
                      );
                    },
                    child: ReusableText(
                      text: "${country.flagEmoji} ${country.phoneCode}",
                      style: appStyle(14, FontWeight.bold, AppColors.kWhiteText, null),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                hintText: "+100-123-4567-890",
                hintStyle: appStyle(14, FontWeight.bold, AppColors.kWhiteText, null),
              ),
            ),
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtpPage()));
              }, //Navigate to OTP Screen
              child: CustomButton(
                width: 325.w,
                height: 50.h,
                buttonColor: AppColors.kPrimaryColor,
                style: appStyle(14, FontWeight.bold, AppColors.kWhiteText, null),
                text: "Send Code",
              ),
            ),
          )
        ]),
      ),
    );
  }
}