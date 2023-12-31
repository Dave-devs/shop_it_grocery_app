import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';
import 'package:shop_it_grocery_app/common/utils/app_size.dart';
import 'package:shop_it_grocery_app/features/account/ui/account_page.dart';
import 'package:shop_it_grocery_app/features/bottom_nav_bar/bloc/bottom_nav_bloc.dart';
import 'package:shop_it_grocery_app/features/cart/ui/cart_page.dart';
import 'package:shop_it_grocery_app/features/favorite/ui/favorite_page.dart';
import 'package:shop_it_grocery_app/features/settings/ui/settings_page.dart';
import 'package:shop_it_grocery_app/features/home/ui/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  List<Widget> pageLists = [
    const HomePage(),
    const CartPage(),
    const FavoritePage(),
    const AccountPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kBackgroundColor,
          body: pageLists[state.pageIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: AppColors.kBlackText),
            child: BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    state.pageIndex = index;
                    context.read<BottomNavBloc>().add(BottomNavigatorEvent(index));
                  });
                },
                currentIndex: state.pageIndex,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.kPrimaryColor,
                unselectedItemColor: AppColors.kItemContainerColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      activeIcon: Icon(Icons.shopping_cart),
                      label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline),
                      activeIcon: Icon(Icons.favorite),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outlined),
                      activeIcon: Icon(Icons.person),
                      label: 'Account'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      activeIcon: Icon(Icons.settings),
                      label: 'Settings'
                  ),
                ]
              ),
          ),
          );
        },
      );
    }
}
