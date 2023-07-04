import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  late final String title;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  // 애플리케이션에서 지도를 이동하기 위한 컨트롤러
  late GoogleMapController _controller;

  @override
  void initState() {
    markers.addAll(list);
    super.initState();
  }

  // 이 값은 지도가 시작될 때 첫 번째 위치입니다.
  LatLng startLocation = LatLng(36.815,127.07557576716);
  /*final CameraPosition _initialPosition =
  CameraPosition(target: LatLng(41.017901, 28.847953));*/
  // 지도 클릭 시 표시할 장소에 대한 마커 목록
  Set<Marker> markers = {};
  List<Marker> list = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(36.8276896,127.1269143),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 피양옥',
          snippet: '대표메뉴 : 평양냉면'
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(36.7992869529,127.1067252192),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 빵아트간',
          snippet: '대표메뉴 : 마들렌'
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(36.7695210823,127.2712778836),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 고향산장',
          snippet: '대표메뉴 : 한우꽃등심'
      ),
    ),
    Marker(
      markerId: MarkerId("4"),
      position: LatLng(36.8448932273,127.1301079708),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 호수매운탕',
          snippet: '대표메뉴 : 매운탕'
      ),
    ),
    Marker(
      markerId: MarkerId("5"),
      position: LatLng(36.8119006902,127.1799627172),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 맑음 카페',
          snippet: '대표메뉴 : 아메리카노'
      ),
    ),
    Marker(
      markerId: MarkerId("6"),
      position: LatLng(36.7812620917,127.1541964358),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 부에노',
          snippet: '대표메뉴 : 핑크솔트카라멜'
      ),
    ),
    Marker(
      markerId: MarkerId("7"),
      position: LatLng(36.7586144525,127.2964286993),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 아우내엄나무순대',
          snippet: '대표메뉴 : 곱창순대철판볶음'
      ),
    ),
    Marker(
      markerId: MarkerId("8"),
      position: LatLng(36.8057643552,127.1275898273),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 모미지',
          snippet: '대표메뉴 : 소바정식'
      ),
    ),
    Marker(
      markerId: MarkerId("9"),
      position: LatLng(36.8090870116,127.173566149),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 포니벨라 카페',
          snippet: '대표메뉴 : 리얼딸기라떼'
      ),
    ),
    Marker(
      markerId: MarkerId("10"),
      position: LatLng(36.8285763098,127.1665523558),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 미소레 커피',
          snippet: '대표메뉴 : 핸드드립 커피'
      ),
    ),
    Marker(
      markerId: MarkerId("11"),
      position: LatLng(36.7824503299,127.1251906831),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 앙프 카페',
          snippet: '대표메뉴 : 아메리카노'
      ),
    ),
    Marker(
      markerId: MarkerId("12"),
      position: LatLng(36.9045112249,127.2783235153),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 청룡원조매운탕',
          snippet: '대표메뉴 : 민물새우매운탕'
      ),
    ),
    Marker(
      markerId: MarkerId("13"),
      position: LatLng(36.8207599723,127.1344332438),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 대안식당',
          snippet: '대표메뉴 : 김치찌개'
      ),
    ),
    Marker(
      markerId: MarkerId("14"),
      position: LatLng(36.8373920946,127.1740458823),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 페어리우드베이커리브런치카페',
          snippet: '대표메뉴 : 브런치 세트'
      ),
    ),
    Marker(
      markerId: MarkerId("15"),
      position: LatLng(36.7752846318,127.1333179253),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 꽃분이네애견카페',
          snippet: '대표메뉴 : 아메리카노'
      ),
    ),

    //아산
    Marker(
      markerId: MarkerId("16"),
      position: LatLng(36.8472744738,127.0278837934),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 논두렁민물매운탕',
          snippet: '대표메뉴 : 어죽'
      ),
    ),
    Marker(
      markerId: MarkerId("17"),
      position: LatLng(36.7794954306,126.9859783136),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 불티나꼬막짬뽕',
          snippet: '대표메뉴 : 꼬막짬뽕'
      ),
    ),
    Marker(
      markerId: MarkerId("18"),
      position: LatLng(36.782723151,127.0038182833),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 홍두깨칼국수',
          snippet: '대표메뉴 : 손칼국수'
      ),
    ),
    Marker(
      markerId: MarkerId("19"),
      position: LatLng(36.7642775425,126.974876951),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 코쿠미 아산신정호수점',
          snippet: '대표메뉴 : 채끝살 스테이크'
      ),
    ),
    Marker(
      markerId: MarkerId("20"),
      position: LatLng(36.7886808888,127.0089232163),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 고려옥',
          snippet: '대표메뉴 : 곰탕/수육'
      ),
    ),
    Marker(
      markerId: MarkerId("21"),
      position: LatLng(36.8640031215,126.8714669055),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 옛날돌집',
          snippet: '대표메뉴 : 장어양념구이'
      ),
    ),
    Marker(
      markerId: MarkerId("22"),
      position: LatLng(36.767129918,126.9706744748),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 바른찜갈비',
          snippet: '대표메뉴 : 매콤마늘찜갈비'
      ),
    ),
    Marker(
      markerId: MarkerId("23"),
      position: LatLng(36.7766858903,127.0566192431),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 이내카페',
          snippet: '대표메뉴 : 이내크림모카'
      ),
    ),
    Marker(
      markerId: MarkerId("24"),
      position: LatLng(36.8674972216,126.8748331725),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 카페 인주',
          snippet: '대표메뉴 : 아메리카노'
      ),
    ),
    Marker(
      markerId: MarkerId("25"),
      position: LatLng(36.7756901423,126.976262627),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 연춘',
          snippet: '대표메뉴 : 장어구이'
      ),
    ),
    Marker(
      markerId: MarkerId("26"),
      position: LatLng(36.7781122244,126.9841479608),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 은행나무집',
          snippet: '대표메뉴 : 황토진흙구이 / 유황오리백숙'
      ),
    ),
    Marker(
      markerId: MarkerId("27"),
      position: LatLng(36.7562450532,126.9702775849),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 고구려(고구려쌈밥)',
          snippet: '대표메뉴 : 제육쌈장정식'
      ),
    ),
    Marker(
      markerId: MarkerId("28"),
      position: LatLng(36.8546422511,126.9815627726),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 낙원가든',
          snippet: '대표메뉴 : 앉은뱅이 갈비탕'
      ),
    ),
    Marker(
      markerId: MarkerId("29"),
      position: LatLng(36.8526865277,126.9592759489),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 영인산마루',
          snippet: '대표메뉴 : 우렁쌈밥정식'
      ),
    ),
    Marker(
      markerId: MarkerId("30"),
      position: LatLng(36.7682535736,127.059227572),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: '명칭 : 카페 플라워돔',
          snippet: '대표메뉴 : 장미에이드'
      ),
    ),
  ];
  List<String> items = [
    '서북구','성성동','성정동','불당동','두정동','봉정','동남구','유량동','청당동','신방동','안서동','문화동','구룡동','병천'
  ];
  String dropdownValue = '동남구';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
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

                  Text('MAP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Text("지금 현재 지역은",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Image.asset('assets/logo3.png'
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.015,
                      ),
                      Text("충청남도 천안시 ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        value: dropdownValue,
                        items: items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),),);
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue ?? '';
                          });
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                      ),

                         Image.asset('assets/coolicon9.png',fit: BoxFit.fill),


                    ],
                  ),
                  //텍스트필드
                  /*SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                      //textAlign: TextAlign.start,
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
                        hintText: "장소명 또는 주소를 입력하세요.",
                        prefixIcon: Icon(Icons.search),
                        //prefixIconColor: Colors.grey,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.71,
              width: MediaQuery.of(context).size.width*1,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: startLocation,
                  zoom: 11.5,
                ),
                mapType: MapType.normal,
                markers: markers.toSet(),
                //markers: markers.toSet(),
                onMapCreated: (controller) {
                  setState(() {
                    _controller = controller;
                  });
                },
                // 클릭한 위치가 중앙에 표시
                /*onTap: (cordinate) {
                _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
                addMarker(cordinate);
              },*/
              ),

            )
          ],
        ),
        resizeToAvoidBottomInset:false,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        // floatingActionButton 클릭시 줌 아웃
        floatingActionButton: FloatingActionButton(
          hoverElevation: 50,
          onPressed: () {
            LatLng newlatlang = LatLng(36.815,127.07557576716);
            _controller.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 11.5)
                  //17 is new zoom level
                ),
            );
          },
          child: Icon(Icons.refresh),
        ),

    );

  }
}

