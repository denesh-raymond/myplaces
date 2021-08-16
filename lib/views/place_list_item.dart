import 'package:flutter/material.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/utils/styles.dart';
import 'package:myplaces/views/cached_image.dart';

/// Displays a [Place] in a view, typically as part of a list
class PlaceListItem extends StatelessWidget {
  final Place place;

  const PlaceListItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _renderBody(),
      ),
    );
  }

  Widget _renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderImage(),
        SizedBox(height: 8.0),
        _renderName(),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderPrice(),
            _renderRating(),
          ],
        )
      ],
    );
  }

  Widget _renderImage() {
    return Center(child: CachedImage(imageUrl: place.imageUrl));
  }

  Widget _renderName() {
    return Text(place.name, style: Styles.large);
  }

  Widget _renderPrice() {
    return Text(place.price, style: Styles.medium);
  }

  Widget _renderRating() {
    return Text(place.rating.toString(), style: Styles.medium);
  }
}
