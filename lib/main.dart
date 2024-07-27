import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/blocs/landingPageBloc/landing_page_bloc.dart';
import 'package:weather_app/repositories/auth_repositary.dart';
import 'package:weather_app/views/ScreenViews/home_page.dart';
import 'package:weather_app/views/landing_page.dart';
import 'package:weather_app/views/AuthViews/signin_page.dart';


void main() {
  final AuthRepositary authRepository = AuthRepositary();

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepositary authRepository;

  MyApp({required this.authRepository});

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthDecider(),
      ),
    );
  }
}

class AuthDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print('Current state: $state');
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        } else if (state is AuthSuccess) {
          return LandingPage();
        } else if (state is AuthInitial) {
          return SigninPage();
        } else {
          return Container();
        }
      },
    );
  }
}
