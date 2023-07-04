import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusScreen extends StatefulWidget {

  @override
  _PlusScreenState createState() => _PlusScreenState();
}
//플러스 리스트1,2
class PlusDataModel1{
  late final String subtitle,title,icon,desc1;
  PlusDataModel1(this.subtitle, this.title,this.icon,this.desc1);
}
class PlusDataModel2{
  late final String plusimage1,desc2;
  PlusDataModel2(this.plusimage1,this.desc2);
}
class PlusDataModel3{
  late final String plustitle,desc3;
  PlusDataModel3(this.plustitle,this.desc3);
}



class _PlusScreenState extends State<PlusScreen> {
  static List<String> subtitle = ['숨어있는','핫플레이스','자주검색하는','인기'];
  static List<String> title = ['맛집','오락,문화시설','장소','더보기'];
  static List<IconData> icons = [Icons.restaurant,Icons.sports_esports,Icons.storefront,Icons.add_box];
  final List<PlusDataModel1> Plusdata1 = List.generate(
      title.length,
          (index)
      => PlusDataModel1('${subtitle[index]}','${title[index]}','${icons[index]}','${subtitle[index]} Description...'));

  static List<String> plusimage1 = [
    'assets/plusimage/plusimage1/plusimage1-1.jpg', 'assets/plusimage/plusimage1/plusimage1-2.jpg', 'assets/plusimage/plusimage1/plusimage1-3.jpg', 'assets/plusimage/plusimage1/plusimage1-4.jpg',
  ];
  static List<String> plusimage2 = [
    'assets/plusimage/plusimage2/plusimage2-1.png', 'assets/plusimage/plusimage2/plusimage2-2.jpg', 'assets/plusimage/plusimage2/plusimage2-3.jpg', 'assets/plusimage/plusimage2/plusimage2-4.jpg',
  ];
  static List<String> plusimage3 = [
    'assets/plusimage/plusimage3/plusimage3-1.jpg', 'assets/plusimage/plusimage3/plusimage3-2.jpg', 'assets/plusimage/plusimage3/plusimage3-3.jpg', 'assets/plusimage/plusimage3/plusimage3-4.jpg',
  ];
  static List<String> plusimage4 = [
    'assets/plusimage/plusimage4/plusimage4-1.jpg', 'assets/plusimage/plusimage4/plusimage4-2.jpg', 'assets/plusimage/plusimage4/plusimage4-3.jpg', 'assets/plusimage/plusimage4/plusimage4-4.jpg',
  ];
  //static List<String> plustitle = ['놀숲 만화방 신부점','캠프 VR','코인노래방 불당점','천안 PC방'];
  int currentIndex1 = 0;
  int currentIndex2 = 0;
  int currentIndex3 = 0;
  int currentIndex4 = 0;

  Color iconColor1 = Colors.grey;
  Color iconColor2 = Colors.grey;
  Color iconColor3 = Colors.grey;
  Color iconColor4 = Colors.grey;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text('PLUS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        // height: 200,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: ListView.builder(
                          // itemExtent: 200,
                            itemExtent: MediaQuery.of(context).size.height * 0.24,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          Plusdata1[index].subtitle,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          Plusdata1[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.03,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              icons[index],
                                              size: 50,
                                              color: Colors.grey,
                                              //color: Colors.,
                                            ),
                                          ],
                                        ),
                                      ),],
                                  ),
                                  margin: EdgeInsets.all(5.0),
                                  // color: Colors.orangeAccent,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: RadialGradient(colors: [Colors.white,Color(0xffEAF3FE)],
                                        center: Alignment(0.5,1),
                                        radius: 0.8
                                    ),
                                  ),
                                ),
                            itemCount: 4),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Card(
                          child: Column(
                            children: [
                              //NPIMAGE
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex1 = index;
                                          });
                                        },
                                        enlargeCenterPage: true,
                                        height: MediaQuery.of(context).size.height*0.29,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 4),
                                        reverse: false,
                                        aspectRatio: 2,
                                        disableCenter: true,
                                        viewportFraction: 29/30,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                      itemCount: plusimage1.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1,
                                            width: MediaQuery.of(context).size.width*1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                plusimage1[i],
                                                //width: MediaQuery.of(context).size.width*1,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      //Plusdata3[index].plustitle,
                                      '놀숲 만화방 신부점',
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
                                        for(int i = 0; i<plusimage1.length; i++)
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                        children: [
                                          //Icon(Icons.favorite_border,),
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
                        childCount: 1,

                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Card(
                          child: Column(
                            children: [
                              //NPIMAGE
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex2 = index;
                                          });
                                        },
                                        enlargeCenterPage: true,
                                        height: MediaQuery.of(context).size.height*0.29,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 4),
                                        reverse: false,
                                        aspectRatio: 2,
                                        disableCenter: true,
                                        viewportFraction: 29/30,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                      itemCount: plusimage1.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1,
                                            width: MediaQuery.of(context).size.width*1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                plusimage2[i],
                                                //width: MediaQuery.of(context).size.width*1,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '캠프 VR',
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
                                        for(int i = 0; i<plusimage1.length; i++)
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
                        childCount: 1,

                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Card(
                          child: Column(
                            children: [
                              //NPIMAGE
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex3 = index;
                                          });
                                        },
                                        enlargeCenterPage: true,
                                        height: MediaQuery.of(context).size.height*0.29,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 4),
                                        reverse: false,
                                        aspectRatio: 2,
                                        disableCenter: true,
                                        viewportFraction: 29/30,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                      itemCount: plusimage1.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1,
                                            width: MediaQuery.of(context).size.width*1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                plusimage3[i],
                                                //width: MediaQuery.of(context).size.width*1,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '코인노래방 불당점',
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
                                        for(int i = 0; i<plusimage1.length; i++)
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
                        childCount: 1,

                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Card(
                          child: Column(
                            children: [
                              //NPIMAGE
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex4 = index;
                                          });
                                        },
                                        enlargeCenterPage: true,
                                        height: MediaQuery.of(context).size.height*0.29,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 4),
                                        reverse: false,
                                        aspectRatio: 2,
                                        disableCenter: true,
                                        viewportFraction: 29/30,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                      itemCount: plusimage1.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1,
                                            width: MediaQuery.of(context).size.width*1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                plusimage4[i],
                                                //width: MediaQuery.of(context).size.width*1,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '천안 PC방',
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
                                        for(int i = 0; i<plusimage1.length; i++)
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
                        childCount: 1,

                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        )
    );
  }
}

class PlusHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width*0.24,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey),
                //textAlign: TextAlign.start,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF6F6F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Color(0xff2b2b2b),
                      width: 1.0,
                    ),
                  ),
                  hintText: "장소명 또는 주소를 입력하세요.",
                  prefixIcon: Icon(Icons.search),
                  //prefixIconColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}

