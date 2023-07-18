// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/model/grocery_data_model.dart';
import '../bloc/home_bloc.dart';

class GroceryTileWidget extends StatelessWidget {

  final HomeBloc homeBloc;
  final GroceryDataModel groceryDataModel;

  const GroceryTileWidget({
    Key? key,
    required this.homeBloc,
    required this.groceryDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Container(
        width: 160.w,
        height: 200.h,
        constraints: BoxConstraints.loose(Size(160.w, 210.h)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius)),
            border: Border.all(color: AppColors.kPrimaryAccentColor)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    width: 160.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.kRadius),
                            topRight: Radius.circular(AppSize.kRadius)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(groceryDataModel.imageUrl))),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          homeBloc.add(OnProductFavoriteItemClickEvent(groceryClickedProduct: groceryDataModel));
                        },
                        icon: Icon(Icons.favorite_outline,
                            size: 20, color: AppColors.kPrimaryColor)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 160.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppSize.kRadius),
                        bottomRight: Radius.circular(AppSize.kRadius))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ReusableText(
                        text: groceryDataModel.name,
                        style: appStyle(
                            12, FontWeight.w600, AppColors.kBlackText, null),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        groceryDataModel.description,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(
                            10, FontWeight.normal, AppColors.kBlackText, null),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ReusableText(
                            text: "\$${groceryDataModel.price}",
                            style: appStyle(16, FontWeight.w500,
                                AppColors.kBlackText, null),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              homeBloc.add(OnProductCartItemClickEvent(groceryClickedProduct: groceryDataModel));
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 20,
                              color: AppColors.kPrimaryColor,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
