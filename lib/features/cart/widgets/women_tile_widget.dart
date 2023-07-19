// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:shop_it_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:shop_it_grocery_app/model/women_accessory_model.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/reusable_text.dart';


class WomenTileWidget extends StatelessWidget {
 
  final CartBloc cartBloc;
  final WomenAccessoryDataModel womenAccessoryDataModel;

  const WomenTileWidget({
    Key? key,
    required this.cartBloc,
    required this.womenAccessoryDataModel,
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
                          image: NetworkImage(womenAccessoryDataModel.imageUrl),
                          fit: BoxFit.cover))),
              
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => cartBloc.add(CartRemoveItemEvent(womenAccessoryDataModel: womenAccessoryDataModel)),
                      icon: Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: AppColors.kPrimaryColor,
                      ))),
            ],
          ),
          // const HeightSpacer(height: 12),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              womenAccessoryDataModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: appStyle(12, FontWeight.bold, AppColors.kBlackText, null),
            ),
          ),

          // const HeightSpacer(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              womenAccessoryDataModel.description,
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
              "\$${womenAccessoryDataModel.price}",
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
