import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('FAQ',style:
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
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('주문결제',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('주문을 확인하고 싶어요.',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('배송',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.13,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('배송 확인은 어디서 하나요?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('배송',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.13,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('배송기간은 얼마나 걸리나요?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('취소/환불',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('주문 취소를 하고 싶어요',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('반품교환',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('교환이나 반품은 어떻게 하나요?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('반품교환',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('교환이나 반품(환불) \n받고 싶어요.',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('반품교환',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                        child: Text('주문을 취소/반품하면 바로 환불 \n받을 수 있나요?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.001,
                width: MediaQuery.of(context).size.width*1,
                child: Divider(color: Color(0xffB1B8C0), thickness: 0.5)),



          ],
        ),
      ),
    );
  }
}