import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/services/authentication/user_session.dart';
import 'package:myplaces/services/firebase/firestore_db.dart';

class AddPlaceController extends GetxController {
  final FirestoreDb _firestoreDb = Get.find<FirestoreDb>();
  final UserSession _userSession = Get.find<UserSession>();
  late final String _imageSeed;

  final TextEditingController nameController = TextEditingController();
  final List<int> ratings = <int>[1, 2, 3, 4, 5];
  final List<String> prices = <String>['\$', '\$\$', '\$\$\$'];

  late final RxInt currentRating = RxInt(ratings.first);
  late final RxString currentPrice = RxString(prices.first);

  String get imageUrl {
    return 'https://picsum.photos/seed/$_imageSeed/600/480';
  }

  @override
  void onInit() {
    super.onInit();
    _imageSeed = DateTime.now().millisecondsSinceEpoch.toString();
  }

  void savePlace() {
    String name = nameController.text;
    Place place = Place(
      imageUrl: imageUrl,
      name: name,
      userId: _userSession.userId,
      rating: currentRating.value,
      price: currentPrice.value,
    );
    _firestoreDb.storePlace(place);
  }
}
