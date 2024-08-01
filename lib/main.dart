import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/blocs/landingPageBloc/landing_page_bloc.dart';
import 'package:weather_app/blocs/home_bloc/home_bloc.dart'; // Import HomeBloc
import 'package:weather_app/blocs/postBlogBloc/post_blog_bloc.dart';
import 'package:weather_app/repositories/auth_repositary.dart';
import 'package:weather_app/repositories/post_repositary.dart';
import 'package:weather_app/views/ScreenViews/home_page.dart';
import 'package:weather_app/views/landing_page.dart';
import 'package:weather_app/views/AuthViews/signin_page.dart';
import 'package:weather_app/widgets/auth_decider.dart';

void main() {
  final AuthRepositary authRepository = AuthRepositary();
  final PostRepositary postRepositary = PostRepositary();

  runApp(MyApp(
    authRepository: authRepository,
    postRepositary: postRepositary,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepositary authRepository;
  final PostRepositary postRepositary;

  MyApp({required this.authRepository, required this.postRepositary});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository)
            ..add(CheckAuthStatus()),
        ),
        BlocProvider(
          create: (context) => LandingPageBloc(),
        ),
        BlocProvider(
          create: (context) => PostBlogBloc(postRepositary: postRepositary),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
