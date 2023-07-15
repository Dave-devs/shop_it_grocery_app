import 'package:flutter/material.dart';
import 'package:shop_it_grocery_app/common/app_colors/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
