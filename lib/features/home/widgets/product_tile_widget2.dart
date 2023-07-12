import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/app_colors/app_colors.dart';
import '../bloc/home_bloc.dart';

class ProductTileWidget2 extends StatelessWidget {
  final String imagePath;
  final PageController controller = PageController(initialPage: 0);

  ProductTileWidget2({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Stack(children: [
          Container(
            width: 300.w,
            height: 140.h,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Image.asset(imagePath),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotColor: AppColors.kWhiteText,
                  activeDotColor: AppColors.kPrimaryColor,
                  radius: 5,
                  dotHeight: 5.h,
                  dotWidth: 6.w,
                  spacing: 3),
            ),
          )
        ]);
      },
    );
  }
}

// Container(
//           width: 300.w,
//           height: 140.h,
//           decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(Radius.circular(6))
//           ),
//         ),