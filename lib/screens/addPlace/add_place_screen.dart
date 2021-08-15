import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  static const String route = '/add_place';

  final List<int> _ratings = <int>[1, 2, 3, 4, 5];
  final List<String> _prices = <String>['\$', '\$\$', '\$\$\$'];

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
        imageUrl: 'https://picsum.photos/600/480',
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _renderNameField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Name',
      ),
    );
  }

  Widget _renderRatingField() {
    return DropdownButton<int>(
      items: _ratings.map((int rating) => DropdownMenuItem<int>(
                value: rating,
                child: Text(rating.toString()),
              )).toList(),
      onChanged: (_) {},
      hint: Text('Rating'),
    );
  }

  Widget _renderPriceField() {
    return DropdownButton<String>(
      items: _prices.map((String price) => DropdownMenuItem<String>(
                value: price,
                child: Text(price),
              )).toList(),
      onChanged: (_) {},
      hint: Text('Price'),
    );
  }

  Widget _renderAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text('Add'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}
