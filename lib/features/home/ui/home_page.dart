import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/features/cart/ui/cart_page.dart';
import 'package:shop_it_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:shop_it_grocery_app/features/home/widgets/eletronic_tile_widget.dart';
import 'package:shop_it_grocery_app/features/home/widgets/fashion_tile_widget.dart';
import 'package:shop_it_grocery_app/features/home/widgets/grocery_tile_widget.dart';
import 'package:shop_it_grocery_app/features/home/widgets/men_tile_widget.dart';
import 'package:shop_it_grocery_app/features/home/widgets/women_tile_widget.dart';
import 'package:shop_it_grocery_app/features/search/ui/search_page.dart';
import '../../../common/utils/app_spacer.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../favorite/ui/favorite_page.dart';
import '../widgets/furniture_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final TextEditingController search = TextEditingController();
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is SearchBarNavigateClickState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
        } else if (state is OnHomeFavoriteNavigateClickState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FavoritePage()));
        } else if (state is OnHomeCartNavigateClickState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is CartTileItemAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added to cart')));
        } else if (state is FavoriteTileItemAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added to favorite')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              backgroundColor: AppColors.kBackgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.all(0.w),
                  child: CustomTextField(
                    width: 270.w,
                    height: 35.h,
                    controller: search,
                    onTap: () {},
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 18.sp, //18, FontWeight.w500, AppColors.kGrey,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kGrey,
                        overflow: TextOverflow.fade),
                    hintText: 'Search...',
                    hintStyle:
                        appStyle(14, FontWeight.w500, AppColors.kGrey, null),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.kGrey,
                    ),
                    showCursor: false,
                    cursorColor: AppColors.kGrey,
                    border: Border.all(color: AppColors.kItemContainerColor),
                    obscureText: false,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Badge(
                          label: const Text("0"),
                          child: IconButton(
                              onPressed: () {},
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.favorite_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        ),
                        Badge(
                          label: const Text("0"),
                          child: IconButton(
                              alignment: Alignment.topRight,
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.cart_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              body: Center(
                child: SpinKitWave(
                  type: SpinKitWaveType.center,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            );

          case HomeSuccessState:
            final successState = state as HomeSuccessState;
            return Scaffold(
              ////////Where am looking for.....................................................................
              //Success State Widget
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.all(0.w),
                  child: CustomTextField(
                    width: 270.w,
                    height: 35.h,
                    controller: search,
                    onTap: () {
                      homeBloc.add(OnHomeSearchIconClickEvent());
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 18.sp, //18, FontWeight.w500, AppColors.kGrey,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kGrey,
                        overflow: TextOverflow.fade),
                    hintText: 'Search...',
                    hintStyle:
                        appStyle(14, FontWeight.w500, AppColors.kGrey, null),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.kGrey,
                    ),
                    showCursor: false,
                    cursorColor: AppColors.kGrey,
                    border: Border.all(color: AppColors.kItemContainerColor),
                    obscureText: false,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Badge(
                          label: const Text("0"),
                          child: IconButton(
                              onPressed: () {
                                homeBloc.add(OnHomeFavoriteIconNavClickEvent());
                              },
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.favorite_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        ),
                        Badge(
                          label:const Text("0"),
                          child: IconButton(
                              alignment: Alignment.topRight,
                              onPressed: () {
                                homeBloc.add(OnHomeCartIconNavClickEvent());
                              },
                              icon: Icon(
                                Ionicons.cart_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              body: ListView(
                children: [
                  SingleChildScrollView(
                    //Top Row Scroll
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 280,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.w)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/advert1.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        const WidthSpacer(width: 10),
                        Container(
                          width: 280,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.w)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/advert2.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        const WidthSpacer(width: 10),
                        Container(
                          width: 280,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.w)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/advert3.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 5),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        //First Grid View for Eletronics
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: successState.eletronicData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: EletronicTileWidget(
                                    homeBloc: homeBloc,
                                    eletronicDataModel:
                                        successState.eletronicData[index]),
                        );
                      }),
                  const HeightSpacer(height: 20),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //Second Grid View for Fashion
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10),
                      itemCount: successState.fashionData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: FashionTileWidget(
                              homeBloc: homeBloc,
                              fashionDataModel:
                                  successState.fashionData[index]),
                        );
                      }),
                  const HeightSpacer(height: 20),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //Third Grid View for Furniture
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10),
                      itemCount: successState.furnitureData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: FurnitureTileWidget(
                              homeBloc: homeBloc,
                              furnitureDataModel:
                                  successState.furnitureData[index]),
                        );
                      }),
                  const HeightSpacer(height: 20),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //Forth Grid View for Grocery
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10),
                      itemCount: successState.groceryData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: GroceryTileWidget(
                              homeBloc: homeBloc,
                              groceryDataModel:
                                  successState.groceryData[index]),
                        );
                      }),
                  const HeightSpacer(height: 20),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //Fifth Grid View for Men Accessory
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10),
                      itemCount: successState.menDataAccessory.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child:  MenTileWidget(
                              homeBloc: homeBloc,
                              menAccessoryDataModel:
                                  successState.menDataAccessory[index]),
                        );
                      }),
                  const HeightSpacer(height: 20),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //Sixth Grid View for Women Accessory
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10),
                      itemCount: successState.womenDataAccessory.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: WomenTileWidget(
                              homeBloc: homeBloc,
                              womenAccessoryDataModel:
                                  successState.womenDataAccessory[index]),
                        );
                      }),
                ],
              ),
            );

          case HomeErrorState:
            return Scaffold(
              //Error State Widget
              backgroundColor: AppColors.kBackgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.all(0.w),
                  child: CustomTextField(
                    width: 270.w,
                    height: 35.h,
                    controller: search,
                    onTap: () {
                      homeBloc.add(OnHomeSearchIconClickEvent());
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 18.sp, //18, FontWeight.w500, AppColors.kGrey,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kGrey,
                        overflow: TextOverflow.fade),
                    hintText: 'Search...',
                    hintStyle:
                        appStyle(14, FontWeight.w500, AppColors.kGrey, null),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.kGrey,
                    ),
                    showCursor: false,
                    cursorColor: AppColors.kGrey,
                    border: Border.all(color: AppColors.kItemContainerColor),
                    obscureText: false,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Badge(
                          label: const Text("0"),
                          child: IconButton(
                              onPressed: () {},
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.favorite_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        ),
                        Badge(
                          label: const Text("0"),
                          child: IconButton(
                              alignment: Alignment.topRight,
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.cart_outline,
                                color: AppColors.kGrey,
                                size: 24,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              body: Center(
                child: Text(
                  "Error",
                  style: appStyle(24, FontWeight.bold, Colors.white, null),
                ),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
