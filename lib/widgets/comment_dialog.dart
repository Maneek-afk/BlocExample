import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/widgets/comments.dart';

class CommentDialog extends StatefulWidget {
  CommentDialog({super.key});

  final List<Map<String, String>> comments = [
    {'username': 'rakesh', 'commentContent': 'First comment!'},
    {'username': 'anita', 'commentContent': 'Nice post!'},
    {'username': 'john', 'commentContent': 'Thanks for sharing.'},
    {'username': 'maria', 'commentContent': 'Interesting perspective.'},
  ];

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 350, // Set the desired width
        height: 500, // Set the desired height
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Comments",
              style: GoogleFonts.afacad(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.comments.map((comment) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0), // Gap between containers
                      child: Comments(
                        username: comment['username']!,
                        commentContent: comment['commentContent']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
