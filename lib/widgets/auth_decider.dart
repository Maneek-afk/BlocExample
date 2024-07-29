import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/views/AuthViews/signin_page.dart';
import 'package:weather_app/views/landing_page.dart';

class AuthDecider extends StatelessWidget {
  const AuthDecider({super.key});

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