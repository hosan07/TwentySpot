import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alarm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('알림',style:
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
            Padding(
              padding: const EdgeInsets.fromLTRB(10,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text ('알림',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.01,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                      child: Text(
                                        '꽁뜨',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.fromLTRB(0,0,200,0),
                                      child: Text(
                                        '베이커리',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        '20시간 전',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '새로 오픈',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      
                                    ),
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '영업중',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bol,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),

                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}