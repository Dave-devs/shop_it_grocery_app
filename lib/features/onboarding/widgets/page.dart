import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';

class PageWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final String subText;
  const PageWidget({super.key, required this.imagePath, required this.text, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.bottomCenter,
    width: AppSize.kWidth,
    height: AppSize.kHeight,
    child: Column(
      children: [
        SizedBox(height: 170.h,),
        Center(
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                width: AppSize.kWidth,
                height: 340.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight
                )),
              ),
            )
        ),
        SizedBox(
            height: 40.h,
          ),
        Column(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kWhiteText,
                      letterSpacing: 0.01,
                      wordSpacing: 0.1
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    subText,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhiteText),
                  ),
                ),
              ],
            )
      ],
    ),
  );
  }
}
