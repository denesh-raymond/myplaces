import 'package:flutter/material.dart';
import 'package:myplaces/screens/add_place_screen.dart';
import 'package:myplaces/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        AddPlaceScreen.route: (context) => AddPlaceScreen(),
      },
      title: 'My Places',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
