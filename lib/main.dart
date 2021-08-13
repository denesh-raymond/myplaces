import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myplaces/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  // TODO - Store this user id in memory, so that we have a unique identifier for our db
  // TODO - Handle authentication errors
  String? userId = userCredential.user?.uid;

  runApp(App());
}
