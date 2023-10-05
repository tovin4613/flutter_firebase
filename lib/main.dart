import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/MyBottomNavigator.dart';
import 'package:flutter_firebase/DialogPopup.dart';
import 'package:flutter_firebase/FireModel.dart';
import 'package:flutter_firebase/FireService.dart';
import 'package:flutter_firebase/ScreenA.dart';
import 'package:flutter_firebase/ScreenB.dart';
import 'package:flutter_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBottomNavigator(),
      // initialRoute: 'MyHomePage',
      // routes: {
      //   'MyHomePage': (context) => MyHomePage(),
      //   'ScreenA': (context) => ScreenA(),
      //   'ScreenB': (context) => ScreenB(),
      // },
    );
  }
}
