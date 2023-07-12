import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/common/utils/app_spacer.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';

class ProductTileWidget1 extends StatelessWidget {
  const ProductTileWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 160.w,
          height: 220.h,
          decoration: BoxDecoration(
            color: AppColors.kContainerColorGrey,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius))
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/onboarding/payment.png', 
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () { 
                    //Add ite to favourite items list screen
                  },
                  icon: Icon(Icons.favorite_outline_rounded, color: AppColors.kPrimaryColor, size: 18,)
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 160.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.kItemContainerColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.kRadius),
                      bottomRight: Radius.circular(AppSize.kRadius)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w,),
                        child: Text(
                          'Floral Shirt',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: appStyle(16, FontWeight.w600, AppColors.kBlackText, null),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          'This is a stylish coat from the Russians a stylish coat from the Russians',
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: appStyle(14, FontWeight.w600, AppColors.kBlackText, null),
                        ),
                      ),
                      const HeightSpacer(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h, right: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$'+"23.9",
                              textAlign: TextAlign.left,
                              style: appStyle(16, FontWeight.w600, AppColors.kPrimaryColor, null),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 14,),
                                Text(
                                  "49|2366",
                                  textAlign: TextAlign.left,
                                  style: appStyle(10, FontWeight.w500, Colors.grey, null),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
}