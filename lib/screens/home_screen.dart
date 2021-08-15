import 'package:flutter/material.dart';
import 'package:myplaces/screens/add_place_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddPlaceScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _openAddPlaceScreen(BuildContext context) {
    Navigator.pushNamed(context, AddPlaceScreen.route);
  }
}
