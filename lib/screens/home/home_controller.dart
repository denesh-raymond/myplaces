import 'package:get/get.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/services/firebase/firestore_db.dart';

class HomeController extends GetxController {
  final FirestoreDb _firestoreDb = Get.find<FirestoreDb>();
  final RxList<Place> places = RxList<Place>();

  @override
  void onInit() {
    places.bindStream(_firestoreDb.getPlaces());
    super.onInit();
  }
}
