import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/DialogPopup.dart';
import 'package:flutter_firebase/FireModel.dart';
import 'package:flutter_firebase/FireService.dart';

class ScreenA extends StatefulWidget {
  ScreenA({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenA_State();
}

class _ScreenA_State extends State<ScreenA> {
  TextEditingController inputController = TextEditingController();

  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
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
                itemBuilder: (BuildContext context, int index) {
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
                                //content: popup(data),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        FireService()
                                            .deleteMemo(data.reference!);
                                        Navigator.of(context).pop();
                                        refreshScreen();
                                      },
                                      child: const Text('삭제'))
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
      bottomSheet: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: inputController,
            decoration: const InputDecoration(hintText: '입력'),
          )),
          ElevatedButton(
            onPressed: () async {
              FireModel fireModel =
                  FireModel(motto: inputController.text, date: Timestamp.now());
              await FireService().createMemo(fireModel.toJson());
              inputController.clear();
              refreshScreen();
            },
            child: const Icon(Icons.send),
          )
        ],
      ),
      //bottomNavigationBar: MyBottomNavigator(),
    );
  }
}
