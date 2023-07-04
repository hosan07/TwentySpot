import 'dart:async';
import 'package:twentyspot/bottombar/bottombar.dart';
import 'package:twentyspot/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'firebase_options.dart';
import 'login/login_screen2.dart';
import 'package:twentyspot/map/map_screen.dart';

void main() async{
  //runApp으로 앱이 실행되기 전에 비동기로 지연이 되더라도 오류가 발생하지 않도록 하는 역할
  WidgetsFlutterBinding.ensureInitialized();
  //irebase.initializeApp()은 앱을 실행할 때 Firebase를 비동기 방식으로 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget {
  @override
  _LogoPage createState() => _LogoPage();
}

class _LogoPage extends State<LogoPage>{
  @override
  void initState() {
    super.initState();
    //splash 로고 화면을 구현한 후 3초정도 대기하기 위한 위젯 사용
    Timer(Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen2(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Center(
          child: Image.asset('assets/logo.png')),
    );

  }
}



