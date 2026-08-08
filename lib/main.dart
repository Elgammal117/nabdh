import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabdh/Core/Features/home/Presentation/View/UserHome.dart';
import 'package:nabdh/Core/Features/payment/Presentation/View/Payment.dart';
import 'package:nabdh/Core/Util/app_colors.dart';
import 'package:nabdh/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 955),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            fontFamily: 'Alexandria',

            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
