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
        body: Container(
          child: Row(
            children: [
              TextButton(
                child: Text('삭제'),
                onPressed: () {
                  FireService().deleteMemo(data.reference!);
                },
              ),
              Builder(
                builder: (context) {
                  return TextButton(
                    child: Text('종료'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              )
            ],
          ),
        )
      ),
    );
  }

}