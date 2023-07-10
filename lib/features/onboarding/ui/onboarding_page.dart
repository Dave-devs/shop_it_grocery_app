// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it_grocery_app/features/login/ui/login_page.dart';
import 'package:shop_it_grocery_app/features/onboarding/widgets/page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/app_colors/app_colors.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final onboardingBloc = OnboardingBloc;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Builder(builder: (context) {
        return BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: AppBar(
                    backgroundColor: AppColors.kBackgroundColor,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const LoginPage())
                          );
                        }, //Navigate to home page
                        child: Text(
                          'Skip',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kWhiteText),
                        ),
                      )
                    ],
                  ),
                ),
                PageView(
                  onPageChanged: (index) {
                    state.page = index;
                    context.read<OnboardingBloc>().add(OnboardingEvent());
                  },
                  controller: pageController,
                  children: const [
                    InkWell(),
                    PageWidget(
                        imagePath: 'assets/onboarding/shop.png',
                        text: 'Number Leading Online Store',
                        subText: 'SHOP IT is the number one leading online market store in Nigeria with 25 years of offering quality services.'),
                    PageWidget(
                        imagePath: 'assets/onboarding/delivery.png',
                        text: 'Free Delivery To Your Door Step',
                        subText: 'Explore a world of fashion, electronics, home essentials, and more, right at your fingertips and have it deliver to your door step..'),
                    PageWidget(
                        imagePath: 'assets/onboarding/payment.png',
                        text: 'Enjoy Hassle Free Payment',
                        subText: 'Say goodbye to slow payment processes. Enjoy smooth payment process with our new payment partner that offers swipe payment without extra charges.'),
                    PageWidget(
                        imagePath: 'assets/onboarding/cashback.png',
                        text: 'Earn Bonus On Goods Bought',
                        subText: 'Discover a wide range of products at jaw-dropping discounts. Get ready to save big and shop smarter. Step into the world of Cheap Buy!'),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 4,
                          effect: ExpandingDotsEffect(
                              dotColor: AppColors.kWhiteText,
                              activeDotColor: AppColors.kPrimaryColor,
                              radius: 5,
                              dotHeight: 5.h,
                              dotWidth: 6.w,
                              spacing: 3),
                        ),
                        GestureDetector(
                          onTap: () {
                            pageController.jumpToPage(state.page);
                          }, //Tap to navigate to page two ..
                          child: Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.kWhiteText,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              //shape: BoxShape.circle
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              size: 24,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
