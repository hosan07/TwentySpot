import 'package:twentyspot/home/food_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../user/user_screen.dart';
import '../home/food_screen.dart';
import '../map/map_screen.dart';
import '../plus/plus_screen.dart';
import '../chat/chat_screen.dart';
import '../chat/chat_screen2.dart';

class bottombar extends StatefulWidget {
  @override
  _bottombar createState() => _bottombar();
}

class _bottombar extends State<bottombar> {
  // bottom네이게이션 바를 사용하기 위해 현재 홈화면을 index 1번으로 설정
  int currentIndex = 0;
  // 0번 foodscreen , 1번

  final screens =[

    FoodScreen2(),
    MapScreen(),
    PlusScreen(),
    //ChatScreen2(),
    ChatScreen(),
    UserScreen(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'map',
              icon: Icon(Icons.location_pin),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'plus',
              icon: Icon(Icons.add_circle_rounded),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'chat',
              icon: Icon(Icons.message),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'user',
              icon: Icon(Icons.supervised_user_circle),
              backgroundColor: Colors.white,
            ),

          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );
  }
}