import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/DialogPopup.dart';
import 'package:flutter_firebase/FireModel.dart';
import 'package:flutter_firebase/FireService.dart';
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
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('abc'),
        ),
        body: Center(
          //child: Text('test'),
          child: FutureBuilder<List<FireModel>>(
            future: FireService().getFireModel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<FireModel> datas = snapshot.data!;
                return ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    FireModel data = datas[index];
                    return Card(
                      child: ListTile(
                        title: Text("${data.motto}"),
                        subtitle: Text("${(data.date)!.toDate()}"),
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: popup(data),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('확인'))
                                  ],
                                );
                              });
                        },
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        bottomSheet: Container(
          child: Row(
            children: <Widget>[
              Flexible(
                  child: TextField(
                controller: inputController,
                decoration: InputDecoration(hintText: '입력'),
              )),
              ElevatedButton(
                onPressed: () async {
                  FireModel _fireModel = FireModel(
                      motto: inputController.text, date: Timestamp.now());
                  await FireService().createMemo(_fireModel.toJson());
                },
                child: Icon(Icons.send),
              )
            ],
          ),
        ));
  }
}
