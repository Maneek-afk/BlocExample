import 'package:flutter/material.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 216, 216),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/testimage1.jpg"),
                fit: BoxFit.cover,),
            ),
          ),

         
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("NASA found an Earth on Moon",
            
            style: TextStyle(
              fontSize: 18, 
              color: Colors.black,            
            ),
            ),
          ),
        ],
      ),
    );
  }
}