import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Service extends StatefulWidget {
  @override
  _Service createState() => _Service();
}

class _Service extends State<Service>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('고객센터',style:
        TextStyle(
            color: Colors.black
        ),
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
                width: MediaQuery.of(context).size.width*2,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,15,0,0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('무엇을 도와드릴까요?',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.11,
                ),
                RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: InkWell(
                      splashColor: Colors.grey, // inkwell color
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: MediaQuery.of(context).size.width*0.2,
                          child: Icon(FontAwesomeIcons.message)),
                      onTap: () {},
                    ),
                    //padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Icon(FontAwesomeIcons.history)),
                    onTap: () {},
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Icon(Icons.details)),
                    onTap: () {},
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.135,),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    '톡상담하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    '톡상담내역',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.11,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    '상세 정보',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.11,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Icon(Icons.announcement_outlined)),
                    onTap: () {},
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Icon(FontAwesomeIcons.history)),
                    onTap: () {},
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.width*0.2,
                        child: Icon(FontAwesomeIcons.question)),
                    onTap: () {},
                  ),
                  //padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.14,),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    '문의하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.14,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    '문의내역',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.17,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,20,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('공지사항',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),

                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Row(
                    children: [
                      Text('트웬티스팟 개인정보 이용내역 안내',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.1,
                      ),
                      Icon(Icons.navigate_next,color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                ],
              ),
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,20,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('전화 문의',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),

                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Row(
                    children: [
                      Icon(Icons.call,color: Colors.grey,size: 13),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.01,
                      ),
                      Text('010-8408-3741 ',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.01,
                      ),
                      Icon(Icons.navigate_next,color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.025,
                  ),
                ],
              ),
            ),





            /*Padding(
              padding: const EdgeInsets.fromLTRB(0,15,0,0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('무엇을 도와드릴까요?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(FontAwesomeIcons.message)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                '톡상담하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(FontAwesomeIcons.history)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                '톡 상담내역',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(FontAwesomeIcons.map)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                '주소 찾기',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(Icons.message)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                '1:1 문의하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(FontAwesomeIcons.history)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                '1:1 문의내역',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.19,
                            width: MediaQuery.of(context).size.width*0.19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Center(child: Icon(FontAwesomeIcons.question)),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,110,0,0),
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,20,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('공지사항',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),

                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Row(
                    children: [
                      Text('트웬티스팟 개인정보 이용내역 안내',
                            style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.1,
                      ),
                      Icon(Icons.navigate_next,color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                ],
              ),
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,20,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('전화 문의',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),

                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Row(
                    children: [
                      Icon(Icons.call,color: Colors.grey,size: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.01,
                      ),
                      Text('010-8408-3741 ',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.01,
                      ),
                      Icon(Icons.navigate_next,color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.025,
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}