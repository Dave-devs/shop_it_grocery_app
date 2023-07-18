import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';
import 'package:shop_it_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:shop_it_grocery_app/features/search/ui/search_page.dart';
import '../../../common/utils/app_spacer.dart';
import '../../../common/widgets/custom_textfield.dart';

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
                child: SpinKitWave(
                  type: SpinKitWaveType.center,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            );
            

          case HomeSuccessState:
            return Scaffold(
              //Success State Widget
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
                              borderRadius: BorderRadius.all(Radius.circular(6.w))
                          ),
                          child: Image.asset(
                            "assets/images/advert1.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const WidthSpacer(width: 10),
                        Container(
                          width: 280,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6.w))
                          ),
                          child: Image.asset(
                            "assets/images/advert2.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const WidthSpacer(width: 10),
                        Container(
                          width: 280,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6.w))
                          ),
                          child: Image.asset(
                            "assets/images/advert3.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                

                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return null;
                      
                        //return ProductTileWidget
                      })
                ],
              ),
            );


          case HomeErrorState:
            return Scaffold( //Error State Widget
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

          default: return const SizedBox();
        }
      },
    );
  }
}
