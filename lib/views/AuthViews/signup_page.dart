import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/views/landing_page.dart';
import 'package:weather_app/views/AuthViews/signin_page.dart';
import 'package:weather_app/widgets/color_pallete.dart';
import 'package:weather_app/widgets/customSnackbar.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          } else if (state is AuthFailed) {
            showSnackBar(context, state.error);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 24,
                  color: ColorPallete.colorBlack,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextfield(controller: _nameController, hintText: "Full Name"),
              const SizedBox(height: 20),
              CustomTextfield(controller: _emailController, hintText: "Email"),
              const SizedBox(height: 20),
              CustomTextfield(controller: _passwordController, hintText: "Password"),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpBtnPressed(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    ),
                    CustomButton(
                      buttonText: "Account Exist",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
