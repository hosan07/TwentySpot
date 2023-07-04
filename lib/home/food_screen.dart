import 'dart:core';
import 'dart:math';
import 'package:twentyspot/bottombar/bottombar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'alarm_screen.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  var currentUser = FirebaseAuth.instance.currentUser;
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  List<Map<String, dynamic>> foundMap = [];

  Color iconColor1 = Colors.grey;
  Color iconColor2 = Colors.grey;
  Color iconColor3 = Colors.grey;
  Color iconColor4 = Colors.grey;
  Color iconColor5 = Colors.grey;


  @override
  void initState() {
    super.initState();
    getCurrentUser();
    foundMap= gridMap;
  }

  void getCurrentUser(){
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
        print(loggedUser!.displayName);
      }
    }catch(e){
      print(e);
    }
  }



  void _runFilter1(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = gridMap;
    } else if(enteredKeyword.isNotEmpty){
      results = gridMap
          .where((user) =>
      //user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
      user["map"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundMap = results;
    });
  }
  List<String> items = [
    '서북구','성성동','성정동','불당동','두정동','봉정','동남구','유량동','청당동','신방동','안서동','문화동','구룡동','병천'
  ];
  String dropdownValue = '동남구';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,8,0,0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/logo2.png'),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,0,0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.54,
                          child: TextField(
                            onChanged: (value) =>  _runFilter1(value),
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey),
                            //textAlign: TextAlign.start,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color(0xff2b2b2b),
                                  width: 1.0,
                                ),
                              ),
                              hintText: "주소를 입력하세요.",
                              //prefixIcon: Icon(Icons.search),
                              //prefixIconColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Icon(FontAwesomeIcons.search,color: Colors.grey,),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,3),
                        child: IconButton(
                          icon: Icon(Icons.notifications,size: 35,color: Colors.grey,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Alarm()));
                          },
                        )
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,5,0,0),
                      child: Row(
                        children: [
                          Image.asset('assets/logo3.png'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,0,0),
                            child: Text("충청남도 천안시 ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DropdownButton<String>(
                            underline: SizedBox.shrink(),
                            value: dropdownValue,
                            items: items.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(value: value, child: Text(value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),),);
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue ?? '';
                              });
                            },
                          ),

                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,10,0),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => bottombar()));

                              },
                              child: Image.asset('assets/coolicon9.png',fit: BoxFit.cover,),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  floatHeaderSlivers: true,
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolleed){
                    return <Widget>[
                      /*SliverAppBar(
                backgroundColor: Color(0xffffffff),
                collapsedHeight: 100,
                expandedHeight: 20,
                pinned: true,
                floating: true,
                elevation: 0.0,
                flexibleSpace: ProfileView(),
              ),*/
                      SliverPersistentHeader(
                        delegate: MyDelegate(
                          TabBar(
                            tabs: [
                              Tab(text: "BEST",),
                              Tab(text: "NOW",),
                            ],
                            indicatorWeight: 3,
                            indicatorColor: Colors.red,
                            unselectedLabelColor: Colors.grey,

                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            labelColor: Colors.red,

                          ),
                        ),
                        floating: false,
                        pinned: true,

                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      GridView.builder(
                        physics:  NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          //그리드뷰 크기 비율
                          childAspectRatio: 5/6,
                          //shrinkWrap: true,
                          //여백
                          mainAxisSpacing:  20.0,
                          crossAxisSpacing: 15.0,
                        ),
                        itemCount: foundMap.length,
                        itemBuilder: (_, index){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xffffffff),

                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      child: ClipRRect(
                                        child: Image.asset(
                                          "${foundMap.elementAt(index)['images']}",
                                          height: MediaQuery.of(context).size.height*0.23,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      onTap: (){
                                        //print('${FirebaseAuth.instance.currentUser!.displayName}');
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail2(foodDataModel2: Nowdata2[index])));
                                      }
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(
                                          "${foundMap.elementAt(index)['title']}",
                                          style: Theme.of(context).textTheme.subtitle1!.merge(
                                            TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                          );
                        },
                      ),
                      //NOWPAGE 구현
                      /*Scaffold(
                backgroundColor: Color(0xffffffff),
                body: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            //NPIMAGE
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(Nowdata[index].NPImage),
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[index],)));
                                      }
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Nowdata[index].NPName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '8m ago',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/coolicon8.png'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[index].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                  child: Text(
                                    Nowdata[index].NTitle,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset('assets/coolicon7.png'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                  child: Text(
                                    Nowdata[index].NContent,
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                  child: Row(
                                      children: [
                                        Text('8m ago',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),),
                                      ]
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child: Row(
                                      children: [
                                        Icon(Icons.favorite_border),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                          child: Icon(Icons.messenger_outline),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                          child: Icon(Icons.share),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                child: Icon(Icons.facebook),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                child: Icon(FontAwesomeIcons.twitter),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                child: Icon(FontAwesomeIcons.instagram),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    }),
              ),*/
                      CustomScrollView(
                        slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                    (context, index) => Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.02,
                                      ),
                                      //NPIMAGE
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(Nowdata[0].NPImage),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[0],)));
                                                }
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                Nowdata[0].NPName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '8m ago',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset('assets/coolicon8.png'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                padEnds: false,
                                                onPageChanged: (index,reason){
                                                  setState(() {
                                                    print(reason.toString());
                                                    currentIndex1 = index;
                                                  });
                                                },
                                                enlargeCenterPage: false,
                                                height: MediaQuery.of(context).size.height*0.3,
                                                autoPlay: true,
                                                autoPlayInterval: Duration(seconds: 3),
                                                reverse: false,
                                                aspectRatio: 2.0,
                                                disableCenter: true,
                                                viewportFraction: 1,
                                              ),
                                              itemCount: nowimage1.length,
                                              itemBuilder: (context,i,id){
                                                return GestureDetector(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height*1.5,
                                                    width: MediaQuery.of(context).size.width*1.5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: Colors.white),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Image.asset(
                                                        nowimage1[i],
                                                        width: MediaQuery.of(context).size.width*1.5,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  /*onTap: (){
                                          var image = plusimage2[i];
                                        },*/
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[0].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[0].NTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                for(int i = 0; i<nowimage1.length; i++)
                                                  Container(
                                                    height: MediaQuery.of(context).size.height*0.02,
                                                    width: MediaQuery.of(context).size.width*0.02,
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentIndex1 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(2,2),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[0].NContent,
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                            child: Row(
                                                children: [
                                                  Text('8m ago',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: iconColor1,
                                                    tooltip: 'Add to favorite',
                                                    onPressed: () {
                                                      setState(() {
                                                        if(iconColor1 == Colors.grey){
                                                          iconColor1 = Colors.red;
                                                        }else{
                                                          iconColor1 = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    child: Icon(Icons.messenger_outline),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.share),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(Icons.facebook),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.twitter),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.instagram),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                    (context, index) => Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.02,
                                      ),
                                      //NPIMAGE
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(Nowdata[1].NPImage),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                                }
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                Nowdata[1].NPName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '8m ago',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset('assets/coolicon8.png'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                padEnds: false,
                                                onPageChanged: (index,reason){
                                                  setState(() {
                                                    print(reason.toString());
                                                    currentIndex2 = index;
                                                  });
                                                },
                                                enlargeCenterPage: false,
                                                height: MediaQuery.of(context).size.height*0.3,
                                                autoPlay: true,
                                                autoPlayInterval: Duration(seconds: 3),
                                                reverse: false,
                                                aspectRatio: 2.0,
                                                disableCenter: true,
                                                viewportFraction: 1,
                                              ),
                                              itemCount: nowimage2.length,
                                              itemBuilder: (context,i,id){
                                                return GestureDetector(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height*1.5,
                                                    width: MediaQuery.of(context).size.width*1.5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: Colors.white),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Image.asset(
                                                        nowimage2[i],
                                                        width: MediaQuery.of(context).size.width*1.5,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  /*onTap: (){
                                          var image = plusimage2[i];
                                        },*/
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[0].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[1].NTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                for(int i = 0; i<nowimage2.length; i++)
                                                  Container(
                                                    height: MediaQuery.of(context).size.height*0.02,
                                                    width: MediaQuery.of(context).size.width*0.02,
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentIndex2 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(2,2),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[1].NContent,
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                            child: Row(
                                                children: [
                                                  Text('8m ago',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: iconColor2,
                                                    tooltip: 'Add to favorite',
                                                    onPressed: () {
                                                      setState(() {
                                                        if(iconColor2 == Colors.grey){
                                                          iconColor2 = Colors.red;
                                                        }else{
                                                          iconColor2 = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    child: Icon(Icons.messenger_outline),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.share),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(Icons.facebook),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.twitter),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.instagram),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                    (context, index) => Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.02,
                                      ),
                                      //NPIMAGE
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(Nowdata[2].NPImage),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[2],)));
                                                }
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                Nowdata[2].NPName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '8m ago',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset('assets/coolicon8.png'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                padEnds: false,
                                                onPageChanged: (index,reason){
                                                  setState(() {
                                                    print(reason.toString());
                                                    currentIndex3 = index;
                                                  });
                                                },
                                                enlargeCenterPage: false,
                                                height: MediaQuery.of(context).size.height*0.3,
                                                autoPlay: true,
                                                autoPlayInterval: Duration(seconds: 3),
                                                reverse: false,
                                                aspectRatio: 2.0,
                                                disableCenter: true,
                                                viewportFraction: 1,
                                              ),
                                              itemCount: nowimage3.length,
                                              itemBuilder: (context,i,id){
                                                return GestureDetector(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height*1.5,
                                                    width: MediaQuery.of(context).size.width*1.5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: Colors.white),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Image.asset(
                                                        nowimage3[i],
                                                        width: MediaQuery.of(context).size.width*1.5,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  /*onTap: (){
                                          var image = plusimage2[i];
                                        },*/
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[0].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[2].NTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                for(int i = 0; i<nowimage2.length; i++)
                                                  Container(
                                                    height: MediaQuery.of(context).size.height*0.02,
                                                    width: MediaQuery.of(context).size.width*0.02,
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentIndex3 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(2,2),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[2].NContent,
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                            child: Row(
                                                children: [
                                                  Text('8m ago',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: iconColor3,
                                                    tooltip: 'Add to favorite',
                                                    onPressed: () {
                                                      setState(() {
                                                        if(iconColor3 == Colors.grey){
                                                          iconColor3 = Colors.red;
                                                        }else{
                                                          iconColor3 = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    child: Icon(Icons.messenger_outline),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.share),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(Icons.facebook),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.twitter),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.instagram),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                    (context, index) => Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.02,
                                      ),
                                      //NPIMAGE
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(Nowdata[3].NPImage),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[3],)));
                                                }
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                Nowdata[3].NPName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '8m ago',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset('assets/coolicon8.png'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                padEnds: false,
                                                onPageChanged: (index,reason){
                                                  setState(() {
                                                    print(reason.toString());
                                                    currentIndex4 = index;
                                                  });
                                                },
                                                enlargeCenterPage: false,
                                                height: MediaQuery.of(context).size.height*0.3,
                                                autoPlay: true,
                                                autoPlayInterval: Duration(seconds: 3),
                                                reverse: false,
                                                aspectRatio: 2.0,
                                                disableCenter: true,
                                                viewportFraction: 1,
                                              ),
                                              itemCount: nowimage4.length,
                                              itemBuilder: (context,i,id){
                                                return GestureDetector(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height*1.5,
                                                    width: MediaQuery.of(context).size.width*1.5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: Colors.white),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Image.asset(
                                                        nowimage4[i],
                                                        width: MediaQuery.of(context).size.width*1.5,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  /*onTap: (){
                                          var image = plusimage2[i];
                                        },*/
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[0].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[3].NTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                for(int i = 0; i<nowimage2.length; i++)
                                                  Container(
                                                    height: MediaQuery.of(context).size.height*0.02,
                                                    width: MediaQuery.of(context).size.width*0.02,
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentIndex4 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(2,2),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[3].NContent,
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                            child: Row(
                                                children: [
                                                  Text('8m ago',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: iconColor4,
                                                    tooltip: 'Add to favorite',
                                                    onPressed: () {
                                                      setState(() {
                                                        if(iconColor4 == Colors.grey){
                                                          iconColor4 = Colors.red;
                                                        }else{
                                                          iconColor4 = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    child: Icon(Icons.messenger_outline),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.share),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(Icons.facebook),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.twitter),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.instagram),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                    (context, index) => Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.02,
                                      ),
                                      //NPIMAGE
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(Nowdata[4].NPImage),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[4],)));
                                                }
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                Nowdata[4].NPName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '8m ago',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset('assets/coolicon8.png'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                padEnds: false,
                                                onPageChanged: (index,reason){
                                                  setState(() {
                                                    print(reason.toString());
                                                    currentIndex5 = index;
                                                  });
                                                },
                                                enlargeCenterPage: false,
                                                height: MediaQuery.of(context).size.height*0.3,
                                                autoPlay: true,
                                                autoPlayInterval: Duration(seconds: 3),
                                                reverse: false,
                                                aspectRatio: 2.0,
                                                disableCenter: true,
                                                viewportFraction: 1,
                                              ),
                                              itemCount: nowimage5.length,
                                              itemBuilder: (context,i,id){
                                                return GestureDetector(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height*1.5,
                                                    width: MediaQuery.of(context).size.width*1.5,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: Colors.white),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Image.asset(
                                                        nowimage5[i],
                                                        width: MediaQuery.of(context).size.width*1.5,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  /*onTap: (){
                                          var image = plusimage2[i];
                                        },*/
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[0].NImage,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width * 0.93,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[4].NTitle,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                for(int i = 0; i<nowimage2.length; i++)
                                                  Container(
                                                    height: MediaQuery.of(context).size.height*0.02,
                                                    width: MediaQuery.of(context).size.width*0.02,
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentIndex5 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(2,2),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                            child: Text(
                                              Nowdata[4].NContent,
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                            child: Row(
                                                children: [
                                                  Text('8m ago',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: iconColor5,
                                                    tooltip: 'Add to favorite',
                                                    onPressed: () {
                                                      setState(() {
                                                        if(iconColor5 == Colors.grey){
                                                          iconColor5 = Colors.red;
                                                        }else{
                                                          iconColor5 = Colors.grey;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.messenger_outline),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.share),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(Icons.facebook),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.twitter),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                          child: Icon(FontAwesomeIcons.instagram),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static List<String> nowimage1 = [
    'assets/nowimage/nowimage1/nowimage1-1.jpg',
    'assets/nowimage/nowimage1/nowimage1-2.jpg',
    'assets/nowimage/nowimage1/nowimage1-3.jpg',
  ];
  static List<String> nowimage2 = [
    'assets/nowimage/nowimage2/nowimage2-1.jpg',
    'assets/nowimage/nowimage2/nowimage2-2.jpg',
    'assets/nowimage/nowimage2/nowimage2-3.jpg',
  ];
  static List<String> nowimage3 = [
    'assets/nowimage/nowimage3/nowimage3-1.jpeg',
    'assets/nowimage/nowimage3/nowimage3-2.png',
    'assets/nowimage/nowimage3/nowimage3-3.jpeg',
  ];
  static List<String> nowimage4 = [
    'assets/nowimage/nowimage4/nowimage4-1.jpg',
    'assets/nowimage/nowimage4/nowimage4-2.jpg',
    'assets/nowimage/nowimage4/nowimage4-3.jpg',
  ];
  static List<String> nowimage5 = [
    'assets/nowimage/nowimage5/nowimage5-1.jpg',
    'assets/nowimage/nowimage5/nowimage5-2.jpg',
    'assets/nowimage/nowimage5/nowimage5-3.jpg',
  ];
  int currentIndex1 = 0;
  int currentIndex2 = 0;
  int currentIndex3 = 0;
  int currentIndex4 = 0;
  int currentIndex5 = 0;

  static List<String> nowpimage = [
    'assets/profile1.png', 'assets/profile2.png', 'assets/profile3.png', 'assets/profile4.png', 'assets/profile5.png',
  ];
  static List<String> nowpname = ['박영재','${FirebaseAuth.instance.currentUser!.displayName}','임새롬','김겨울','고은'];
  static List<String> nowimage = [
    'assets/nowimage/nowimage1/nowimage1-1.jpg', 'assets/nowimage/nowimage2/nowimage2-1.jpg','assets/nowimage/nowimage3/nowimage3-1.jpeg', 'assets/nowimage/nowimage4/nowimage4-1.jpg', 'assets/nowimage/nowimage5/nowimage5-1.jpg',
  ];
  static List<String> nowtitle = ['카페 슈','마초쉐프 천안점','얼큰한 뼈해장국','금강산 식당','그리고스페셜티'];
  static List<String> nowcontent = ['카페 분위기가 너무 좋았어요','피자 정말 맛있었어요','뼈해장국 맛집입니다','파스타 맛있네요 다음에 또 올게요','빵이 맛있어요!'];
  final List<FoodDataModel> Nowdata = List.generate(
      nowpname.length,
          (index)
      => FoodDataModel('${nowpimage[index]}','${nowpname[index]}','${nowimage[index]}','${nowtitle[index]}',
          '${nowcontent[index]}','${nowpname[index]} Description...'));
  static List<Map<String,dynamic>> gridMap = [
    {"title": "1   호수 매운탕", "map": '충청남도 천안시 서북구 성성2길 61(성성동)', "images": "assets/#image (1).png",}, {"title": "2   고향산장", "map": '충청남도 천안시 동남구 북면 충절로 1474-19', "images": "assets/#image (2).png",}, {"title": "3   맑음", "map": '충청남도 천안시 동남구 유량로 194(유량동)', "images": "assets/#image (3).png",}, {"title": "4   부에노", "map": '충청남도 천안시 동남구 남부대로 336(청당동)', "images": "assets/#image (4).png",}, {"title": "5   아우내엄나무순대", "map": '충청남도 천안시 동남구 병천면 아우내순대길 1', "images": "assets/#image (5).png",}, {"title": "6   모미지", "map": '충청남도 천안시 서북구 서부대로 427', "images": "assets/#image (6).png",}, {"title": "7   포니벨라", "map": '충청남도 천안시 동남구 유량로 130(유량동)', "images": "assets/#image (7).png",}, {"title": "8   미소레 커피", "map": '충청남도 천안시 동남구 단대로 161-1', "images": "assets/#image (8).png",}, {"title": "9   앙프", "map": '충청남도 천안시 동남구 천안천변길 139(신방동)', "images": "assets/#image (9).png",},
    {"title": "10   청룡원조매운탕", "map": '충청남도 천안시 서북구 입장면 성진로 1406', "images": "assets/#image (10).png",}, {"title": "11   아우내한방순대", "map": '충청남도 천안시 동남구 병천면 아우내순대길 18', "images": "assets/#image (11).png",}, {"title": "12   대안식당", "map": '충청남도 천안시 서북구 도원7길 17(성정동)', "images": "assets/#image (12).png",}, {"title": "13   페어리우드베이커리", "map": '충청남도 천안시 동남구 천호지길 44(안서동)', "images": "assets/#image (13).png",}, {"title": "14   꽃분이네애견카페", "map": '충청남도 천안시 동남구 통정4로 22-25(신방동)', "images": "assets/#image (14).png",}, {"title": "15   더몰트하우스", "map": '충청남도 천안시 서북구 불당31길 22(불당동)', "images": "assets/#image (15).png",}, {"title": "16   천진", "map": '충청남도 천안시 동남구 공고담길 43-5', "images": "assets/#image (16).png",}, {"title": "17   들꽃", "map": '충청남도 천안시 동남구 호서대길 110', "images": "assets/#image (17).png",}, {"title": "18   충남집순대", "map": '충청남도 천안시 동남구 병천면 충절로 1748', "images": "assets/#image (18).png",}, {"title": "19   진성석갈비", "map": '충청남도 천안시 동남구 목천읍 충절로 1166', "images": "assets/#image (19).png",},
    {"title": "20   석산장", "map": '충청남도 천안시 동남구 문화로 30(문화동)', "images": "assets/#image (20).png",}, {"title": "21   밥상차려주는집", "map": '충청남도 천안시 동남구 풍세로 702(구룡동)', "images": "assets/#image (21).png",}, {"title": "22   이화갈비", "map": '충청남도 천안시 서북구 불당29길 18(불당동)', "images": "assets/#image (22).png",}, {"title": "23   명동보리밥", "map": '충청남도 천안시 서북구 미라7길 17', "images": "assets/#image (23).png",}, {"title": "24   천안 등촌샤브칼국수", "map": '충청남도 천안시 서북구 두정로 132(두정동)', "images": "assets/#image (24).png",}, {"title": "25   기린더매운갈비찜", "map": '충청남도 천안시 서북구 불당16길 34-6', "images": "assets/#image (25).png",}, {"title": "26   카페시스터즈", "map": '충청남도 천안시 서북구 불당16길 1', "images": "assets/#image (26).png",}, {"title": "27   승지원", "map": '충청남도 천안시 서북구 노태산로 41(백석동)', "images": "assets/#image (27).png",}, {"title": "28   정초밥", "map": '충청남도 천안시 서북구 늘푸른6길 5-11(두정동)', "images": "assets/#image (28).png",}, {"title": "29   여물통", "map": '충청남도 천안시 서북구 봉정로 111', "images": "assets/#image (29).png",},
    {"title": "30   청화집", "map": '충청남도 천안시 동남구 병천면 충절로 1749', "images": "assets/#image (30).png",},
  ];

  static List<String> mpimage = [
    'assets/#image (1).png', 'assets/#image (2).png', 'assets/#image (3).png', 'assets/#image (4).png', 'assets/#image (5).png', 'assets/#image (6).png', 'assets/#image (7).png', 'assets/#image (8).png', 'assets/#image (9).png',
    'assets/#image (10).png', 'assets/#image (11).png', 'assets/#image (12).png', 'assets/#image (13).png', 'assets/#image (14).png', 'assets/#image (15).png', 'assets/#image (16).png', 'assets/#image (17).png', 'assets/#image (18).png', 'assets/#image (19).png',
    'assets/#image (20).png', 'assets/#image (21).png', 'assets/#image (22).png', 'assets/#image (23).png', 'assets/#image (24).png', 'assets/#image (25).png', 'assets/#image (26).png', 'assets/#image (27).png', 'assets/#image (28).png', 'assets/#image (29).png', 'assets/#image (30).png',
  ];
  static List<String> mptext = [
    '호수 매운탕', '고향산장','맑음','부에노','아우내엄나무순대','모미지','포니벨라','미소레 커피','앙프','청룡원조매운탕',
    '아우내한방순대','대안식당','페어리우드베이커리','꽃분이네애견카페','더몰트하우스','천진','들꽃','충남집순대','진성석갈비','석산장',
    '밥상차려주는집','이화갈비','명동보리밥','천안 등촌샤브칼국수','기린더매운갈비찜','카페시스터즈','승지원','정초밥','여물통','청화집',
  ];
  static List<String> mplocation = [
    '충청남도 천안시 서북구 성성2길 61(성성동)','충청남도 천안시 동남구 북면 충절로 1474-19','충청남도 천안시 동남구 유량로 194(유량동)','충청남도 천안시 동남구 남부대로 336(청당동)','충청남도 천안시 동남구 병천면 아우내순대길 1','충청남도 천안시 서북구 서부대로 427','충청남도 천안시 동남구 유량로 130(유량동)',
    '충청남도 천안시 동남구 단대로 161-1','충청남도 천안시 동남구 천안천변길 139(신방동)','충청남도 천안시 서북구 입장면 성진로 1406','충청남도 천안시 동남구 병천면 아우내순대길 18','충청남도 천안시 서북구 도원7길 17(성정동)','충청남도 천안시 동남구 천호지길 44(안서동)','충청남도 천안시 동남구 통정4로 22-25(신방동)','충청남도 천안시 서북구 불당31길 22(불당동)','충청남도 천안시 동남구 공고담길 43-5','충청남도 천안시 동남구 호서대길 110',
    '충청남도 천안시 동남구 병천면 충절로 1748','충청남도 천안시 동남구 목천읍 충절로 1166','충청남도 천안시 동남구 문화로 30(문화동)','충청남도 천안시 동남구 풍세로 702(구룡동)','충청남도 천안시 서북구 불당29길 18(불당동)','충청남도 천안시 서북구 미라7길 17','충청남도 천안시 서북구 두정로 132(두정동)','충청남도 천안시 서북구 불당16길 34-6','충청남도 천안시 서북구 불당16길 1','충청남도 천안시 서북구 노태산로 41(백석동)','충청남도 천안시 서북구 늘푸른6길 5-11(두정동)','충청남도 천안시 서북구 봉정로 111','충청남도 천안시 동남구 병천면 충절로 1749',
  ];

  final List<FoodDataModel2> Nowdata2 = List.generate(
      mpimage.length,
          (index)
      => FoodDataModel2('${mpimage[index]}','${mptext[index]}','${mplocation[index]}','${mpimage[index]} Description...'));
}
//1. NOW Page 이미지 클릭 이벤트 클래스
class FoodDataModel{
  late final String NPImage,NPName,NImage,NTitle,NContent,desc1;
  FoodDataModel(this.NPImage, this.NPName, this.NImage, this.NTitle, this.NContent,this.desc1);
}
class FoodDataModel2 {
  late final String mpimage,mptitle,mplocation,desc2;
  FoodDataModel2(this.mpimage,this.mptitle,this.mplocation,this.desc2);
}


class FoodDetail extends StatelessWidget{
  final FoodDataModel foodDataModel;
  FoodDetail({Key? key, required this.foodDataModel}):super(key: key);
  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('프로필',style:
        TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
        )),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Color(0xffBDBDBD),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffBDBDBD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          foodDataModel.NPImage,
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.005,
                  ),
                  Text(foodDataModel.NPName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.005,
                  ),
                  /*Text('설명',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blueGrey,
                    ),),*/
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                //NPIMAGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,20,0),
                          child: Text(
                            '8m ago',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/coolicon8.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(foodDataModel.NImage,
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.93,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                      child: Text(
                        foodDataModel.NTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                      child: Text(
                        foodDataModel.NContent,
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,3,0,0),
                      child: Row(
                          children: [
                            Text('8m ago',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),),
                          ]
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,0,0),
                      child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: _iconColor,
                              tooltip: 'Add to favorite',
                              onPressed: () {
                                setState(() {
                                  if(_iconColor == Colors.grey){
                                    _iconColor = Colors.red;
                                  }else{
                                    _iconColor = Colors.grey;
                                  }
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Icon(Icons.messenger_outline),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Icon(Icons.share),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(Icons.facebook),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(FontAwesomeIcons.twitter),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(FontAwesomeIcons.instagram),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}


//2. 맛집 이미지 정보

class FoodDetail2 extends StatelessWidget{
  final FoodDataModel2 foodDataModel2;
  const FoodDetail2({Key? key, required this.foodDataModel2}):super(key: key);
  static List<String> reviewimage = ['assets/profile2.png','assets/profile3.png','assets/profile1.png','assets/profile4.png','assets/profile5.png'];
  static List<String> reviewname = ['${FirebaseAuth.instance.currentUser!.displayName}','김겨울','박영재','임새롬','고은'];
  static List<String> reviewcontent = ['맛있었어요!','다음에 또 올게요!','Good!','맛있어요!','다음에 또 올게요~'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(foodDataModel2.mptitle,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),

        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Color(0xffBDBDBD),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffBDBDBD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*SizedBox(
                    height: 10,
                    width: 30,
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    /*child: Image.asset(
                      //"${mapp.gm.elementAt(index)['images']}",
                      foodDataModel2.mpimage,
                      height: MediaQuery.of(context).size.height*0.28,
                      width: MediaQuery.of(context).size.width*1,
                      fit: BoxFit.fill,
                    ),*/
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.28,
                      width: MediaQuery.of(context).size.width*1,
                      child: Image.asset(
                        foodDataModel2.mpimage,
                        //width: MediaQuery.of(context).size.width*1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //Text(foodDataModel2.mplocation),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            /*Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: Text(
                                        '최근 포스팅',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '마초쉐프 천안점',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '피자 정말 맛있었어요',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                      child: Row(
                                          children: [
                                            Text('8m ago',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ),),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: Row(
                                          children: [
                                            Icon(Icons.favorite_border),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                              child: Icon(Icons.messenger_outline),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                              child: Icon(Icons.share),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.facebook),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(FontAwesomeIcons.twitter),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(FontAwesomeIcons.instagram),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '시유당',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                      child: Text(
                                        '카페 안 뷰가 너무 좋았어요!',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,3,0,0),
                                      child: Row(
                                          children: [
                                            Text('8m ago',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ),),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: Row(
                                          children: [
                                            Icon(Icons.favorite_border),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                              child: Icon(Icons.s_outline),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                              child: Icon(Icons.share),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(Icons.facebook),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(FontAwesomeIcons.twitter),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                    child: Icon(FontAwesomeIcons.instagram),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                      child: Text(
                                        '최근 리뷰',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.01,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile2.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '천호산',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '맛있었어요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 5,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),*/
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.06,
                    ),
                    Image.asset(
                      'assets/logo3.png',
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.01,
                    ),
                    Text('주소 : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(foodDataModel2.mplocation,
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.26,
                  width: MediaQuery.of(context).size.width*2,
                  child: Stack(
                    children: [
                      Image.asset('assets/fooddetailmap.png'),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,40,80,0),
                            child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blue,
                                size: 50
                            )
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,80,0),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.045,
                            width: MediaQuery.of(context).size.width*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,80,0),
                            child: Icon(
                              Icons.restaurant,
                              color: Colors.blue,
                            )
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40,0,0,0),
                          child: Text(
                              foodDataModel2.mptitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                  child: Text(
                    '리뷰',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: Random().nextInt(5)+1,
                              (context, index) => Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              //NPIMAGE
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(reviewimage[index]),
                                        ),
                                      ),
                                      /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                          child: Text(
                                            reviewname[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                          child: Text(
                                            reviewcontent[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                        child: Text(
                                          '8m ago',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        /*child: Image.asset('assets/coolicon8.png'),*/
                                        child: RatingBar.builder(
                                          initialRating: Random().nextInt(5)+3.0,
                                          minRating: 3,
                                          itemSize: 20,
                                          allowHalfRating: true,
                                          itemBuilder: (context,_) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating){},
                                        ),

                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          ),
                        )),
                    /*SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile4.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '김겨울',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '다음에 또올게요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile1.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '박영재',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              'Good!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile3.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '임새롬',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '맛있어요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile5.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '고은',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '다음에 또올게요~',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),*/
                  ],
                ),
              ),
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.06,
                ),
                Image.asset(
                  'assets/logo3.png',
                  height: MediaQuery.of(context).size.height*0.03,
                  width: MediaQuery.of(context).size.width*0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.01,
                ),
                Text('주소 : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(foodDataModel2.mplocation,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.26,
              width: MediaQuery.of(context).size.width*2,
              child: Stack(
                children: [
                  Image.asset('assets/fooddetailmap.png'),
                  Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                  ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,40,80,0),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                          size: 50
                        )
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,80,0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.045,
                        width: MediaQuery.of(context).size.width*0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,80,0),
                      child: Icon(
                        Icons.restaurant,
                        color: Colors.blue,
                      )
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(40,0,0,0),
                        child: Text(
                          foodDataModel2.mptitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),

                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                          child: Icon(Icons.messenger_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                          child: Icon(Icons.share),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                child: Icon(Icons.facebook),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                child: Icon(FontAwesomeIcons.twitter),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                child: Icon(FontAwesomeIcons.instagram),
                              ),
                            ],
                          ),
                        ),
                      ]
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text(
                    '리뷰',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Expanded(
              child: Container
                (
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile2.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '천호산',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '맛있었어요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 5,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile4.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '김겨울',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '다음에 또올게요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile1.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '박영재',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              'Good!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile3.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '임새롬',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '맛있어요!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) => Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                //NPIMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('assets/profile5.png'),
                                          ),
                                        ),
                                        /*onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[1],)));
                                      }*/
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '고은',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                                            child: Text(
                                              '다음에 또올게요~',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(60,10,0,0),
                                          child: Text(
                                            '8m ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          /*child: Image.asset('assets/coolicon8.png'),*/
                                          child: RatingBar.builder(
                                            minRating: 1,
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder: (context,_) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating){},
                                          ),

                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        )),


                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
      /*body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('dd'),
            pinned: true,
            // floating 설정. SliverAppBar는 스크롤 다운되면 화면 위로 사라짐.
            // true: 스크롤 업 하면 앱바가 바로 나타남. false: 리스트 최 상단에서 스크롤 업 할 때에만 앱바가 나타남
            floating: false,
            // flexibleSpace에 플레이스홀더를 추가
            flexibleSpace: Placeholder(),
            // 최대 높이
            expandedHeight: 200,
          ),
          // 리스트 추가
          SliverList(
            // 아이템을 빌드하기 위해서 delegate 항목을 구성함
            // SliverChildBuilderDelegate는 ListView.builder 처럼 리스트의 아이템을 생성해줌
            delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 150),
          ),
        ],
      ),*/
    );
  }
}
//delegate
class MyDelegate extends SliverPersistentHeaderDelegate{
  MyDelegate(this.tabBar);
  final TabBar tabBar;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 100,
      color: Color(0xffffffff),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }}

//위 상단 고정바 UI
/*class ProfileView extends StatelessWidget {
  //TextEditingController editingController = TextEditingController();
  /*static List<String> duplicateItems = [
    '호수 매운탕', '고향산장','맑음','부에노','아우내엄나무순대','모미지','포니벨라','미소레 커피','앙프','청룡원조매운탕',
    '아우내한방순대','대안식당','페어리우드베이커리','꽃분이네애견카페','더몰트하우스','천진','들꽃','충남집순대','진성석갈비','석산장',
    '밥상차려주는집','이화갈비','명동보리밥','천안 등촌샤브칼국수','기린더매운갈비찜','카페시스터즈','승지원','정초밥','여물통','청화집',
  ];*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15,8,0,0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/logo2.png'),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.54,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                      //textAlign: TextAlign.start,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF6F6F6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xff2b2b2b),
                            width: 1.0,
                          ),
                        ),
                        hintText: "검색어를 입력하세요.",

                        //prefixIcon: Icon(Icons.search),
                        //prefixIconColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Icon(FontAwesomeIcons.search,color: Colors.grey,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,0,0,0),
                child: Icon(Icons.notifications,size: 35,color: Colors.grey,),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,0,0),
                child: Row(
                  children: [
                    Image.asset('assets/logo3.png'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,0,0,0),
                      child: Text("충청남도 천안시 동남구",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                        Icons.arrow_drop_down_outlined
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,30,0),
                      child: Image.asset('assets/2km.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/
