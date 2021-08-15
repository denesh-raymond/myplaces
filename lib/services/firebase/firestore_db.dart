import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myplaces/models/place.dart';
import 'package:myplaces/services/authentication/user_session.dart';
import 'package:myplaces/services/firebase/firebase_constants.dart' as Constants;

class FirestoreDb {
  final FirebaseFirestore _firestore;
  final UserSession _userSession;
  final CollectionReference<Place> _placesReference;

  FirestoreDb._(this._firestore, this._userSession, this._placesReference);

  factory FirestoreDb(UserSession userSession) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Place> placesReference = firestore.collection(Constants.COLLECTION_PLACES).withConverter<Place>(
      fromFirestore: (snapshot, _) => Place.fromJson(snapshot.data()!),
      toFirestore: (place, _) => place.toJson(),
    );
    return new FirestoreDb._(firestore, userSession, placesReference);
  }

  Future<void> storeUser() {
    DocumentReference userDoc = _firestore.collection(Constants.COLLECTION_USERS).doc(_userSession.userId);
    return userDoc.get().then((doc) {
      if (!doc.exists) {
        userDoc.set({Constants.FIELD_USER_ID: _userSession.userId});
      }
    });
  }

  Future<void> storePlace(Place place) async {
    _placesReference.add(place);
  }

  Stream<List<Place>> getPlaces() {
    return _placesReference
        .where(Constants.FIELD_USER_ID, isEqualTo: _userSession.userId)
        .snapshots()
        .map((snapshots) => snapshots.docs)
        .map((documents) => documents.map((place) => place.data()).toList());
  }
}
