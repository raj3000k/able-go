// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_app/pages/emergencyContacts.dart';
import 'package:sample_app/pages/searching.dart';
import 'package:sample_app/pages/traffic.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';
import 'package:sample_app/pages/SOSPage.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA';

  static const String mapBoxStyleId = 'cljieeo5b002d01o40q7fdqs1';

  static final myLocation = LatLng(21.250000, 81.629997);
}

class MapMarker {
  final LatLng? location;

  MapMarker({
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    location: LatLng(21.2441408, 81.6319132),
  ),
  MapMarker(
    location: LatLng(21.2441417, 81.6290905),
  ),
  MapMarker(
    location: LatLng(21.2448292, 81.6403591),
  ),
];

class _MapTestingState extends State<MapTesting> {
  bool wheelChairSelected = false;
  bool onboardingSelected = false;
  bool signSelected = false;
  String wheelchair = 'Wheelchair';
  String assistance = 'Onboard Assistance';
  String sign = 'Sign language';
  String pickUp = 'Pick Up';
  String destination = '';

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final _startPointController = TextEditingController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myController.text = 'Pick Up';
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/profilePicture.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.electric_scooter),
            //   title: Text('Electric'),
            //   onTap: () {
            //     // Handle Electric press
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Your Rides'),
              onTap: () {
                // Handle Your Rides press
              },
            ),
            ListTile(
              leading: Icon(Icons.handshake_outlined),
              title: Text('Pay Later'),
              onTap: () {
                // Handle Ola Money press
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
              onTap: () {
                // Handle Payments press
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('My Emergency Contacts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyContactPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('SOS Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SOSPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.headset_mic),
              title: Text('Support'),
              onTap: () {
                // Handle Support press
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle About press
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                _globalKey.currentState?.openDrawer();
              }),
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  }),
              FlutterMap(
                options: MapOptions(
                    minZoom: 5,
                    maxZoom: 18,
                    zoom: 13,
                    center: AppConstants.myLocation),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/harshu0711/cljieeo5b002d01o40q7fdqs1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: LatLng(21.2441408, 81.6319132),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/location.png',
                                ));
                          }),
                      (wheelChairSelected
                          ? (Marker(
                              point: LatLng(21.2441417, 81.6290905),
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/cabIcon.png',
                                    ));
                              },
                            ))
                          : Marker(
                              point: LatLng(21.2448292, 81.6403591),
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/cabIcon.png',
                                    ));
                              })),
                      Marker(
                          point: LatLng(21.249053, 81.6694206),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                      Marker(
                          point: LatLng(21.2487162, 81.6696642),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                      Marker(
                          point: LatLng(21.2480497, 81.6280602),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                      Marker(
                          point: LatLng(21.2458125, 81.6228147),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                      Marker(
                          point: LatLng(21.2425595, 81.6249827),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                      Marker(
                          point: LatLng(21.2521533, 81.6364437),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/cabIcon.png',
                                ));
                          }),
                    ],
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 18),
            child: ElevatedButton.icon(
              onPressed: () => UrlLauncher.launch("tel://21213123123"),
              icon: Icon(
                // <-- Icon
                Icons.phone,
                size: 24.0,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              label: Text('Book with a call'), // <-- Text
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 300,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                          onPressed: () {
                            setState(() {
                              wheelChairSelected = !wheelChairSelected;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: (wheelChairSelected
                                            ? Colors.black
                                            : Colors.white),
                                        width: 2.0,
                                        style: BorderStyle.solid))),
                            child: Column(
                              children: [
                                Image.asset('assets/images/wheelchairCab.png',
                                    height: 60, width: 60),
                                Text(
                                  'Wheelchair',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                          )),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.white)),
                        onPressed: () {
                          setState(() {
                            onboardingSelected = !onboardingSelected;
                          });
                        },
                        child: Container(
                          // margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: (onboardingSelected
                                          ? Colors.black
                                          : Colors.white),
                                      width: 2.0,
                                      style: BorderStyle.solid))),
                          child: Column(
                            children: [
                              Image.asset('assets/images/onboarding.png',
                                  height: 60, width: 60),
                              Text(
                                'On/off Boarding',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                          onPressed: () {
                            setState(() {
                              signSelected = !signSelected;
                            });
                          },
                          child: Container(
                            // margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: (signSelected
                                            ? Colors.black
                                            : Colors.white),
                                        width: 2.0,
                                        style: BorderStyle.solid))),
                            child: Column(
                              children: [
                                Image.asset('assets/images/signLanguage.png',
                                    height: 60, width: 60),
                                Text(
                                  'Sign Language',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17))),
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: 'Search Destination',
                                suffixIcon: Icon(Icons.search),
                                fillColor: Colors.black),
                            onChanged: (value) {
                              // Handle search input
                              setState(() {
                                destination = value;
                              });
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchingCab(
                                          wheelChairSelected:
                                              wheelChairSelected,
                                          onboardingSelected:
                                              onboardingSelected,
                                          signSelected: signSelected,
                                          pickUp: pickUp,
                                          destination: destination)));
                            },
                            child: Text('Search Ride')),
                            Container(
                          margin: EdgeInsets.only(top: 10, left: 18),
                          child: ElevatedButton.icon(
                            
                            icon: Icon(
                              // <-- Icon
                              Icons.traffic,
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Traffic(
                                      wheelChairSelected:
                                              wheelChairSelected,
                                          onboardingSelected:
                                              onboardingSelected,
                                          signSelected: signSelected,
                                      pickUp: pickUp,
                                      destination: destination,
                                    )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            
                            label: Text(
                              'Route Prediction',
                              style: TextStyle(color: Colors.white),
                            ), // <-- Text
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.black,
                          onPressed: () {
                            _globalKey.currentState?.openDrawer();
                          }),
                      Container(
                        height: 25,
                        width: 280,
                        margin: EdgeInsets.all(10),
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // child: TextField(
                        //   decoration: InputDecoration(
                        //     enabledBorder: InputBorder.none,
                        //     hintText: 'Pick Up Location',
                        //     suffixIcon: Icon(Icons.search),
                        //   ),
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 MapBoxAutoCompleteWidget(
                        //                   apiKey:
                        //                       'pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA',
                        //                   onSelect: (place) {
                        //                     pickUp = place.placeName;
                        //                   },
                        //                   limit: 10,
                        //                 )));
                        //   },
                        //   enabled: true,
                        //   // onChanged: (value) {
                        //   //   // Handle search input
                        //   //   pickUp = value;
                        //   // },
                        // ),
                        child: TextField(
                          onChanged: (value) {
                            pickUp = value;
                          },
                          controller: myController,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapBoxAutoCompleteWidget(
                                  apiKey:
                                      "pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA",
                                  hint: "Select starting point",
                                  onSelect: (place) {
                                    // TODO : Process the result gotten
                                    // pickUp=place;
                                    setState(() {
                                      pickUp = place.placeName.toString();
                                      myController.text = pickUp;
                                    });
                                  },
                                  limit: 10,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
