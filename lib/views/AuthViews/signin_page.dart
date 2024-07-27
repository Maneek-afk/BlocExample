import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/views/landing_page.dart';
import 'package:weather_app/views/AuthViews/signup_page.dart';
import 'package:weather_app/widgets/color_pallete.dart';
import 'package:weather_app/widgets/customSnackbar.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_textfield.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

   final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          } else if (state is AuthSnackbarState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
            },
            child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sign In",
                            style: TextStyle(
                              fontSize: 24,
                              color: ColorPallete.colorBlack
                            ),
                          ),
              
                          const SizedBox(height: 20,),
              
                          CustomTextfield(controller: _emailController, hintText: "Email"),
              
                          const SizedBox(height: 20,),
              
                          CustomTextfield(controller: _passwordController, hintText: "Passowrd"),
              
                          const SizedBox(height: 20,),
              
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 CustomButton(
                                  buttonText: "SignIn", 
                                  onPressed: () {  
                                    BlocProvider.of<AuthBloc>(context).add(SignInBtnPressed(
                                      email: _emailController.text.trim(), 
                                      password: _passwordController.text.trim()
                                    ));
                                  },
                                ),
                                 CustomButton(
                                  buttonText: "Create Account", 
                                  onPressed: () { 
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    ),
          ),
        );
    
  }
}