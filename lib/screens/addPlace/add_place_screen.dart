import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/screens/addPlace/add_place_controller.dart';
import 'package:myplaces/screens/addPlace/add_place_controller.dart';
import 'package:myplaces/screens/addPlace/add_place_controller.dart';

class AddPlaceScreen extends StatelessWidget {
  static const String route = '/add_place';

  final AddPlaceController _controller = Get.put<AddPlaceController>(AddPlaceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _renderBody(context),
        ),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderImage(),
          SizedBox(height: 16.0),
          _renderNameField(),
          SizedBox(height: 16.0),
          _renderRatingField(),
          SizedBox(height: 16.0),
          _renderPriceField(),
          SizedBox(height: 16.0),
          _renderAddButton(context),
        ],
      ),
    );
  }

  Widget _renderImage() {
    return Container(
      height: 200.0,
      child: CachedNetworkImage(
        imageUrl: _controller.imageUrl,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _renderNameField() {
    return TextField(
      controller: _controller.nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Name',
      ),
    );
  }

  Widget _renderRatingField() {
    return Obx(
      () => DropdownButton<int>(
        value: _controller.currentRating.value,
        items: _controller.ratings
            .map((int rating) => DropdownMenuItem<int>(
                  value: rating,
                  child: Text(rating.toString()),
                ))
            .toList(),
        onChanged: (rating) => _controller.currentRating.value = rating!,
        hint: Text('Rating'),
      ),
    );
  }

  Widget _renderPriceField() {
    return Obx(
      () => DropdownButton<String>(
        value: _controller.currentPrice.value,
        items: _controller.prices.map((String price) => DropdownMenuItem<String>(
                  value: price,
                  child: Text(price),
                )).toList(),
        onChanged: (price) => _controller.currentPrice.value = price!,
        hint: Text('Price'),
      ),
    );
  }

  Widget _renderAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _savePlace(),
      child: Text('Add'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }

  void _savePlace() {
    _controller.savePlace();
    Get.back();
  }
}
