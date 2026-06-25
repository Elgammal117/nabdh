import 'package:flutter/material.dart';
import 'package:nabdh/Auth/Otp.dart';
import 'package:nabdh/Auth/Sign_in.dart';
import 'package:nabdh/Auth/Sign_up.dart';
import 'package:nabdh/Client/Home_page.dart';
import 'package:nabdh/Nurse/Data_check.dart';
import 'package:nabdh/Splash_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff00685F)),
          ),
          home: DataCheckPage(),
        );
      },
    );
  }
}
