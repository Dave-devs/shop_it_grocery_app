// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/model/men_accessory_model.dart';
import '../bloc/home_bloc.dart';

class MenTileWidget extends StatelessWidget {

  final MenAccessoryDataModel menAccessoryDataModel;
  final HomeBloc homeBloc;
  
  const MenTileWidget({
    Key? key,
    required this.menAccessoryDataModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0)),
                      image: DecorationImage(
                          image: NetworkImage(menAccessoryDataModel.imageUrl),
                          fit: BoxFit.cover))),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () =>
                        homeBloc.add(OnProductFavoriteItemClickEvent(menClickedProduct: menAccessoryDataModel)),
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    )),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => homeBloc.add(OnProductCartItemClickEvent(menClickedProduct: menAccessoryDataModel)),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: AppColors.kPrimaryColor,
                      ))),
            ],
          ),
          // const HeightSpacer(height: 12),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              menAccessoryDataModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: appStyle(12, FontWeight.bold, AppColors.kBlackText, null),
            ),
          ),

          // const HeightSpacer(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              menAccessoryDataModel.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              style:
                  appStyle(10, FontWeight.normal, AppColors.kBlackText, null),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              "\$${menAccessoryDataModel.price}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              style:
                  appStyle(12, FontWeight.w500, AppColors.kPrimaryColor, null),
            ),
          ),
        ]
      )
    );
  }
}
