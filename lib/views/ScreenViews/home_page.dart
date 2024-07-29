import 'package:flutter/material.dart';
import 'package:weather_app/widgets/blog_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              BlogPost(
                imageurl: 'https://i.pinimg.com/564x/13/53/b5/1353b50878986edfb384690fd48db8a9.jpg', 
                postTitle: 'Cat Is Drunk: The Hilarious Tale of Whiskers Unexpected Adventure', 
                postContent: 'Who knew that a little too much catnip could lead to such a raucous adventure? Meet Whiskers, the feline sensation who’s taken the internet by storm with his latest escapade. In this post, we delve into the hilarious world of a cat who’s had a bit too much fun, proving that sometimes, even our furry friends can get a little tipsy. ', 
                heartIconPressed: () {  

                }, 
                commentIconPressed: () { 

                 }, 
                shareIconPressed: () {  

                },
              ), 

              const SizedBox(height: 30,),

              BlogPost(imageurl: 'https://i.pinimg.com/564x/91/5d/a8/915da86b19142a1c0bf10875a6358b82.jpg',
               postTitle: 'The Unexpected Party Animal:', 
               postContent: 'It all started on a quiet Saturday afternoon. Whiskers, a typically reserved and dignified feline, was lounging in his favorite sunspot when his owner decided to give him a new toy—a plush mouse stuffed with catnip. What happened next was nothing short of extraordinary.', 
               heartIconPressed: (){}, 
               commentIconPressed: (){}, 
               shareIconPressed: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}
