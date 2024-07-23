import 'package:flutter/material.dart';
import 'package:weather_app/views/signin_page.dart';
import 'package:weather_app/views/signup_page.dart';
import 'package:weather_app/widgets/color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Project',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: ColorPallete.colorGrey
      ),
      
      home:  SigninPage(),
    );
  }
}

