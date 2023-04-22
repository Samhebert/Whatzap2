import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatzap/RouteGenerator.dart';
import 'Home.dart';
import 'Login.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore db = FirebaseFirestore.instance;

  try {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("usuarios").
    doc("001").
    set({"nome": "Samuel"});
  } on Exception catch(e){
    print(e);
  }catch(e){
    print(e);
  }

  runApp(
      MaterialApp(
      home: Login(),
    theme: ThemeData(
        primaryColor: Color(0xff075E54), accentColor: Color(0xff25D366)),
    initialRoute: '/',
    onGenerateRoute: RouteGeneretor.generateRoute,
    debugShowCheckedModeBanner: false,
  ));
}
