import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({
    super.key,
    required this.imageurl,
    required this.postTitle,
    required this.postContent,
    required this.heartIconPressed,
    required this.commentIconPressed,
    required this.shareIconPressed,
  });

  final String imageurl;
  final String postTitle;
  final String postContent;
  final VoidCallback heartIconPressed;
  final VoidCallback commentIconPressed;
  final VoidCallback shareIconPressed;

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 450, 
      decoration: BoxDecoration(
        color: Color.fromARGB(179, 240, 240, 240),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                widget.imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Scrollable Content

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Heading

                    Text(
                      widget.postTitle,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 10,),
                    // Content

                    Text(
                      widget.postContent,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 71, 71, 71),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Icons
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.heart,
                    size: 28,
                  ),
                  onPressed: widget.heartIconPressed,
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.commentDots,
                    size: 28,
                  ),
                  onPressed: widget.commentIconPressed,
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.paperPlane,
                    size: 26,
                  ),
                  onPressed: widget.shareIconPressed,
                ),
              ],
            ),
          ),
          
          // View all comments
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(
              "View all 12 comments",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          
          // Comment TextField
          TextField(
            decoration: InputDecoration(
              hintText: "Add a comment...",
              hintStyle: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color.fromARGB(255, 71, 71, 71),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: TextButton(
                onPressed: () {
                  
                  print("Post button pressed!");
                },
                child: const Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 34, 156, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
