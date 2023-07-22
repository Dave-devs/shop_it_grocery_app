import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/eletronic_tile_widget.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/fashion_tile_widget.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/furniture_tile_widget.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/grocery_tile_widget.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/men_tile_widget.dart';
import 'package:shop_it_grocery_app/features/favorite/widgets/women_tile_widget.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/utils/app_spacer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();

  @override
  void initState() {
    favoriteBloc.add(FavoriteInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: ReusableText(
          text: 'Favorite Items List',
          style: appStyle(20, FontWeight.bold, AppColors.kWhiteText, null),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        bloc: favoriteBloc,
        listener: (context, state) { },
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        builder: (context, state) {
          switch(state.runtimeType) {
            case FavoriteSuccessState:
            final successState = state as FavoriteSuccessState;
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
                              favoriteBloc: favoriteBloc,
                              eletronicDataModel: successState.eletronicItem[index]),
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
                              favoriteBloc: favoriteBloc,
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
                              favoriteBloc: favoriteBloc,
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
                        child: GroceryTileWidget(
                              favoriteBloc: favoriteBloc,
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
                              favoriteBloc: favoriteBloc,
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
                              favoriteBloc: favoriteBloc,
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
