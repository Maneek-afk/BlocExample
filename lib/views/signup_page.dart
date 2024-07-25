import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/signin_page.dart';
import 'package:weather_app/widgets/color_pallete.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});

  final TextEditingController _nameController1=TextEditingController();
   final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create Account",
              style: TextStyle(
                fontSize: 24,
                color: ColorPallete.colorBlack
              ),
            ),

            const SizedBox(height: 20,),

            CustomTextfield(controller: _emailController, hintText: "Full Name"),

            const SizedBox(height: 20,),

            CustomTextfield(controller: _emailController, hintText: "Email"),

            const SizedBox(height: 20,),

            CustomTextfield(controller: _passwordController, hintText: "Passowrd"),

            const SizedBox(height: 20,),

            

             Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   CustomButton(
                    buttonText: "Sign Up", 
                    onPressed: (){

                      
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
                    )
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}