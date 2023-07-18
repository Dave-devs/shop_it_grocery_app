// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/model/furniture_data_model.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/reusable_text.dart';
import '../bloc/home_bloc.dart';

class FurnitureTileWidget extends StatelessWidget {

  final HomeBloc homeBloc;
  final FurnitureDataModel furnitureDataModel;

  const FurnitureTileWidget({
    Key? key,
    required this.homeBloc,
    required this.furnitureDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Center(
        child: Container(
          width: 160.w,
          height: 210.h,
          constraints: BoxConstraints.loose(Size(160.w, 210.h)),
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: AppColors.kPrimaryAccentColor),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.kRadius))
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () { 
                      homeBloc.add(OnProductFavoriteItemClickEvent(furnitureClickedProduct: furnitureDataModel));
                    },
                    icon: Icon(Icons.favorite_outline, size: 20, color: AppColors.kPrimaryColor,)
                  ),
                  IconButton(
                  onPressed: () { 
                    homeBloc.add(OnProductFavoriteItemClickEvent(furnitureClickedProduct: furnitureDataModel));
                  },
                  icon: Icon(Icons.shopping_cart_outlined, size: 20, color: AppColors.kPrimaryColor,))
                ],
              ),
              Container(
                width: 160.w,
                height: 85.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(furnitureDataModel.imageUrl),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ReusableText(
                      text: furnitureDataModel.name,
                      style: appStyle(
                          12, FontWeight.w600, AppColors.kBlackText, null),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      furnitureDataModel.description,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: appStyle(
                          10, FontWeight.normal, AppColors.kBlackText, null),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ReusableText(
                      text: "\$${furnitureDataModel.price}",
                      style: appStyle(
                          16, FontWeight.w500, AppColors.kPrimaryAccentColor, null),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
