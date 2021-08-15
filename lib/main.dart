import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplaces/app.dart';
import 'package:myplaces/services/authentication/user_session.dart';
import 'package:myplaces/services/firebase/firestore_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // TODO - sign in after app has been created, display loading state
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  // TODO - Handle authentication errors
  String? userId = userCredential.user?.uid;
  UserSession userSession = UserSession(userId!);

  FirestoreDb firestoreDb = FirestoreDb(userSession);
  firestoreDb.storeUser();

  Get.put<UserSession>(userSession);
  Get.put<FirestoreDb>(firestoreDb);

  runApp(App());
}
