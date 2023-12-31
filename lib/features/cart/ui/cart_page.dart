import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/features/cart/bloc/cart_bloc.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/eletronic_tile_widget.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/fashion_tile_widget.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/furniture_tile_widget.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/grocery_tile_widget.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/men_tile_widget.dart';
import 'package:shop_it_grocery_app/features/cart/widgets/women_tile_widget.dart';
import '../../../common/utils/app_spacer.dart';
import '../../../common/widgets/reusable_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: ReusableText(
          text: 'Cart Items List',
          style: appStyle(20, FontWeight.bold, AppColors.kWhiteText, null),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) { },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch(state.runtimeType) {
            case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView(
              children: [

                GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: EletronicTileWidget(
                              cartBloc: cartBloc,
                              eletronicDataModel: successState.eletronicItem[index]
                        ),
                      );
                    }
                  ),

                  const HeightSpacer(height: 20),

                  GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: FashionTileWidget(
                              cartBloc: cartBloc,
                              fashionDataModel: successState.fashionItem[index]),
                      );
                    }
                  ),

                  const HeightSpacer(height: 20),

                  GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: FurnitureTileWidget(
                              cartBloc: cartBloc,
                              furnitureDataModel: successState.furnitureItem[index]),
                      );
                    }
                  ),

                  const HeightSpacer(height: 20),

                  GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child:GroceryTileWidget(
                              cartBloc: cartBloc,
                              groceryDataModel: successState.groceryItem[index],
                            )
                      );
                    }
                  ),

                  const HeightSpacer(height: 20),

                  GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: MenTileWidget(
                              cartBloc: cartBloc,
                              menAccessoryDataModel: successState.menAccessoryItem[index],
                            )
                      );
                    }
                  ),

                  const HeightSpacer(height: 20),

                  GridView.builder(
                  gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: successState.eletronicItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: WomenTileWidget(
                              cartBloc: cartBloc,
                              womenAccessoryDataModel: successState.womenAccessoryItem[index],
                            )
                      );
                    }
                  ),

                ],
              );
              
              default:
            }

          return Container();
        },
      ),
    );
  }
}
