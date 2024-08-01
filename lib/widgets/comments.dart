import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comments extends StatelessWidget {
  final String username;
  final String commentContent;

  const Comments({super.key, required this.username, required this.commentContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
      ),
      padding: const EdgeInsets.all(10), // Optional: Add some padding inside the border
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            username,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                commentContent,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
