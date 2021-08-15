import 'package:myplaces/services/firebase/firebase_constants.dart' as Constants;

/// A user's favourite place
class Place {
  final String imageUrl;
  final String name;
  final String userId;
  final int rating;
  final String price;

  Place({
    required this.imageUrl,
    required this.name,
    required this.userId,
    required this.rating,
    required this.price,
  });

  Place.fromJson(Map<String, Object?> json)
      : this(
          imageUrl: json[Constants.FIELD_IMAGE_URL]! as String,
          name: json[Constants.FIELD_NAME]! as String,
          userId: json[Constants.FIELD_USER_ID]! as String,
          rating: json[Constants.FIELD_RATING]! as int,
          price: json[Constants.FIELD_PRICE]! as String,
        );

  Map<String, Object?> toJson() {
    return {
      Constants.FIELD_IMAGE_URL: imageUrl,
      Constants.FIELD_NAME: name,
      Constants.FIELD_USER_ID: userId,
      Constants.FIELD_RATING: rating,
      Constants.FIELD_PRICE: price,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
