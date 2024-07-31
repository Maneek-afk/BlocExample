import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key});

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text("Comments",
                style: GoogleFonts.afacad(           
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: Colors.black,
                  ),
                ),
      ),                         
              content: Container(
                height: 400,
                width: 320,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 10,),
                    Text("@Rakesh",
                      style: GoogleFonts.lato(           
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    
                  ),
                  
                     Row(                     
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bla bla bla bla bla ",
                        style: GoogleFonts.lato(           
                        fontSize: 14,
                        color: Colors.black,
                      ),
                ),
                         IconButton( 
                          onPressed: () { }, 
                         icon: const Icon(Icons.favorite_border_outlined)
                         )
                      ],
                    )

                  ],
                ),
              ),
            );
        }
}