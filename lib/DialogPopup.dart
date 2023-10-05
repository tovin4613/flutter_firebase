import 'package:flutter/material.dart';
import 'package:flutter_firebase/FireModel.dart';
import 'package:flutter_firebase/FireService.dart';

class popup extends StatelessWidget {
  FireModel data;
  popup(var this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Row(
        children: [
          TextButton(
            child: const Text('삭제'),
            onPressed: () {
              FireService().deleteMemo(data.reference!);
            },
          ),
        ],
      )),
    );
  }
}
