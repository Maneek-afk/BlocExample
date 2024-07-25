import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/views/signin_page.dart';
import 'package:weather_app/views/signup_page.dart';
import 'package:weather_app/views/testPage.dart';
import 'package:weather_app/widgets/color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          title: 'Demo Project',
          debugShowCheckedModeBanner: false,
    
          theme: ThemeData(
            scaffoldBackgroundColor: ColorPallete.colorGrey
          ),
          
          home:  const Testpage(),
        ),
    );
  }
}

