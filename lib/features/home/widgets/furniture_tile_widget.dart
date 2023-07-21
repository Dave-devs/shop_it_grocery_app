// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                          image: NetworkImage(furnitureDataModel.imageUrl),
                          fit: BoxFit.cover))),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () =>
                        homeBloc.add(OnProductFavoriteItemClickEvent(furnitureClickedProduct: furnitureDataModel)),  
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    )),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => homeBloc.add(OnProductCartItemClickEvent(furnitureClickedProduct: furnitureDataModel)),
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
              furnitureDataModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: appStyle(12, FontWeight.bold, AppColors.kBlackText, null),
            ),
          ),

          // const HeightSpacer(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              furnitureDataModel.description,
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
              "\$${furnitureDataModel.price}",
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
