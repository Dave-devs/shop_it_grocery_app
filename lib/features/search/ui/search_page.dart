import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/reusable_text.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: CustomTextField(
            width: 310.w,
            height: 35.h,
            obscureText: false,
            controller: search,
            onChanged: (value) {
              //Implement Search here
            },
            keyboardType: TextInputType.text,
              style: TextStyle(
                  fontSize: 18.sp, //18, FontWeight.w500, AppColors.kGrey,
                  fontWeight: FontWeight.normal,
                  color: AppColors.kGrey,
                  overflow: TextOverflow.fade
              ),
              hintText: 'Search...',
              hintStyle: appStyle(14, FontWeight.w500, AppColors.kGrey, null),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.kGrey,
              ),
              showCursor: true,
              cursorColor: AppColors.kGrey,
              border: Border.all(color: AppColors.kItemContainerColor),
          ),
        ),
        centerTitle: true,
      )
    );
  }
}
