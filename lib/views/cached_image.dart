import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A cached image with a configurable height
class CachedImage extends StatelessWidget {
  final double height;
  final String imageUrl;

  const CachedImage({required this.imageUrl, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
