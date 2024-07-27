import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:weather_app/blocs/landingPageBloc/landing_page_bloc.dart';
import 'package:weather_app/views/AuthViews/signin_page.dart';
import 'package:weather_app/views/ScreenViews/favorite_page.dart';
import 'package:weather_app/views/ScreenViews/home_page.dart';
import 'package:weather_app/views/ScreenViews/profile_page.dart';

List<BottomNavigationBarItem> bottomNavItems= <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Home"
    ),

  const BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: "Favorite"
    ),

  const BottomNavigationBarItem(
    icon: Icon(Icons.account_box_outlined),
    label: "Profile"
    ),
];

const List<Widget> bottomNavScreen=<Widget>[
  HomePage(),
  FavoritePage(),
  ProfilePage(),
];

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  const Text('H-Blog', style: TextStyle(fontFamily: 'Tiny5')),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOut());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninPage()),
                  );
                },
              ),
            ],
          ),
          
           body: Center(child: bottomNavScreen.elementAt(state.tabIndex),),
           bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index){
              BlocProvider.of<LandingPageBloc>(context).add(TabChangedEvent(tabIndex: index));
            },
           ),
          
        );
      },
    );
  }
}
