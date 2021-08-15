import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/screens/addPlace/add_place_screen.dart';
import 'package:myplaces/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  final HomeController _controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
      ),
      body: _renderPlaces(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddPlaceScreen(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _renderPlaces() {
    return Obx(
      () => ListView.separated(
        itemBuilder: (_, index) {
          Place place = _controller.places[index];
          return Text(place.name);
        },
        separatorBuilder: (_, __) => SizedBox(height: 16.0),
        itemCount: _controller.places.length,
      ),
    );
  }

  void _openAddPlaceScreen() {
    Get.toNamed(AddPlaceScreen.route);
  }
}
