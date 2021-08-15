import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/screens/add_place_screen.dart';
import 'package:myplaces/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HomeScreen.route,
      getPages: [
        GetPage(name: HomeScreen.route, page: () => HomeScreen()),
        GetPage(name: AddPlaceScreen.route, page: () => AddPlaceScreen()),
      ],
      title: 'My Places',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
