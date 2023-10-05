import 'package:flutter/material.dart';
import 'package:flutter_firebase/ScreenA.dart';
import 'package:flutter_firebase/ScreenB.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<MyBottomNavigator> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    ScreenA(),
    const ScreenB(),
    const Text(
      '마이페이지',
      style: optionStyle,
    )
  ];

  void _onItemTabbed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_comment),
            label: '게시판',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.blue[400],
        onTap: _onItemTabbed,
      ),
    );
  }
}
