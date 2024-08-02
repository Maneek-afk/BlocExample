import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Center(
            child: ClipOval(
              child: Image.asset(
                "assets/images/testimage1.jpg", // Replace with a valid image URL
                width: 140, // Increased size for better visibility
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Text(
              "Username",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.black,
              ),
            ),

            

           Padding(
             padding: const EdgeInsets.all(40),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "146",
                      style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                    Text(
                      "Followers",
                      style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "146",
                      style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                    Text(
                      "Followers",
                      style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  ],
                )
              ],
                       ),
           )
        ],
      ),
    );
  }
}
