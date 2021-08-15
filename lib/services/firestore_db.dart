import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/services/firebase_constants.dart' as Constants;

class FirestoreDb {
  final FirebaseFirestore _firestore;
  final CollectionReference<Place> _placesReference;

  FirestoreDb._(this._firestore, this._placesReference);

  factory FirestoreDb() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Place> placesReference = firestore.collection(Constants.COLLECTION_PLACES).withConverter<Place>(
      fromFirestore: (snapshot, _) => Place.fromJson(snapshot.data()!),
      toFirestore: (place, _) => place.toJson(),
    );
    return new FirestoreDb._(firestore, placesReference);
  }

  Future<void> storeUser(String userId) async {
    _firestore.collection(Constants.COLLECTION_USERS).doc(userId);
  }

  Future<void> storePlace(Place place) async {
    _placesReference.add(place);
  }

  Stream<List<Place>> getPlaces(String userId) {
    return _placesReference
        .where(Constants.FIELD_USER_ID, isEqualTo: userId)
        .snapshots()
        .map((snapshots) => snapshots.docs)
        .map((documents) => documents.map((place) => place.data()).toList());
  }
}
