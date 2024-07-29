import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/blocs/postBlogBloc/post_blog_bloc.dart';
import 'package:weather_app/views/ScreenViews/home_page.dart';
import 'package:weather_app/widgets/custom_button.dart';

class AddpostPage extends StatefulWidget {
  AddpostPage({super.key});

  @override
  State<AddpostPage> createState() => _AddpostPageState();
}

class _AddpostPageState extends State<AddpostPage> {
  bool _isLoading = false;

  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _imageController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<PostBlogBloc, PostBlogState>(
        listener: (context, state) {
          if (state is PostBlogLoading) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is PostBlogSuccess) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (state is PostBlogFailure) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Text(
                  "Upload Image",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 12, left: 15),
                    constraints: BoxConstraints(
                      maxHeight: height,
                      maxWidth: width
                    ),
                    filled: false,
                    hintText: "Enter image url",
                    suffixIcon: const Icon(Icons.camera_alt_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text(
                  "Title",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 16, left: 15),
                    constraints: BoxConstraints(
                      maxHeight: height,
                      maxWidth: width
                    ),
                    filled: false,
                    hintText: "Enter a Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text(
                  "Description",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 16, left: 15),
                    constraints: BoxConstraints(
                      maxHeight: height,
                      maxWidth: width
                    ),
                    filled: false,
                    hintText: "Enter a Description...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1
                      )
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<PostBlogBloc>(context).add(postUploadbtnPressed(
                            title: _titleController.text,
                            content: _contentController.text,
                            imageUrl: _imageController.text
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color.fromARGB(255, 158, 200, 228),
                        ),
                        child: Text(
                          "Upload",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 2, 2, 2),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
