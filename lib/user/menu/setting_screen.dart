import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('설정',style:
        TextStyle(
            color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('알림 설정',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('알림 및 소리',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('방해금지 시간 설정',style: TextStyle(fontSize: 17),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),

            Padding(
              padding: const EdgeInsets.fromLTRB(30,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('사용자 설정',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('계정 / 정보 관리',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('기타 설정',style: TextStyle(fontSize: 17),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('기타 설정',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('언어 설정',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('캐시 데이터 삭제하기',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text('버전 정보',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),

                    child: Text('탈퇴하기',style: TextStyle(fontSize: 17),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: TextButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text('로그아웃',style: TextStyle(fontSize: 17),
                      ),
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}