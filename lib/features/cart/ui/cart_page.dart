import 'package:flutter/material.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
      ),
      backgroundColor: AppColors.kBackgroundColor,
    );
  }
}
