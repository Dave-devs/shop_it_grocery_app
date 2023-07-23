import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_it_grocery_app/features/bottom_nav_bar/bloc/bottom_nav_bloc.dart';
import 'package:shop_it_grocery_app/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:shop_it_grocery_app/features/onboarding/ui/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => OnboardingBloc()),
        BlocProvider(create: (BuildContext context) => BottomNavBloc()),
        // BlocProvider(create: (BuildContext (context) => HomeBloc())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          title: 'Davedevs',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const  OnboardingPage(),
        ),
      ),
    );
  }
}
