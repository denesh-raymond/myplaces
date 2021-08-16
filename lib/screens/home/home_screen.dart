import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/screens/addPlace/add_place_screen.dart';
import 'package:myplaces/screens/home/home_controller.dart';
import 'package:myplaces/utils/styles.dart';
import 'package:myplaces/views/place_list_item.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  final HomeController _controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
        title: Text('My Places'),
      ),
      body: SafeArea(
        child: _renderPlaces(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddPlaceScreen(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _renderPlaces() {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) => PlaceListItem(place: _controller.places[index]),
        separatorBuilder: (_, __) => SizedBox(height: 16.0),
        itemCount: _controller.places.length,
      ),
    );
  }

  void _openAddPlaceScreen() {
    Get.toNamed(AddPlaceScreen.route);
  }
}
