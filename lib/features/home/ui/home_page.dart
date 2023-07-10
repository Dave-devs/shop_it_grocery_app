import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () { },
          icon: Icon(Icons.menu, color: AppColors.kWhiteText,)
        ),
        title: Text(
          'SHOP IT',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.kWhiteText
          ),
        ),
        actions: [
          IconButton(
            onPressed: () { },
            icon: Icon(Icons.person_outline,
            color: AppColors.kWhiteText,
            )
          ),
          IconButton(
            onPressed: () { },
            icon: Icon(Icons.shopping_cart_outlined,
            color: AppColors.kWhiteText,
            )  
          ),
        ],
      ),
    );
  }
}