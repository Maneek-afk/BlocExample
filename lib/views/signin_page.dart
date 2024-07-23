import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/signIn_bloc/sign_in_bloc.dart';
import 'package:weather_app/widgets/color_pallete.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_textfield.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

   final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final SignInBloc signInBloc= SignInBloc();
    return  BlocConsumer<SignInBloc, SignInState>(
      bloc: signInBloc,
      // listenWhen: (previous, current) {

      // },
      // buildWhen: (previous, current) {
        
      // },

      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
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
                  padding:  EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       CustomButton(
                        buttonText: "SignIn", 
                        onPressed: () {  
                          
                        },
                      ),
                       CustomButton(
                        buttonText: "Create Account", 
                        onPressed: () { 

                        },
                      )
                    ],
                  ),
                )
                
              ],
            ),
          ),
        );
      },
    );
  }
}