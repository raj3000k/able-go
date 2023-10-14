// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_app/pages/emergencyContacts.dart';
import 'package:sample_app/pages/searching.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';
import 'package:sample_app/pages/SOSPage.dart';

class Traffic extends StatefulWidget {
  final String pickUp;
  final String destination;
  final bool wheelChairSelected;
  final bool onboardingSelected;
  final bool signSelected;
  const Traffic({Key? key, required this.pickUp, required this.destination, required this.wheelChairSelected,
    required this.onboardingSelected,
    required this.signSelected,
  })
      : super(key: key);

  @override
  State<Traffic> createState() => _TrafficState();
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

class _TrafficState extends State<Traffic> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final _startPointController = TextEditingController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var points = <LatLng>[
      new LatLng(21.2441408, 81.6319132),
      new LatLng(21.252193, 81.6044256)
    ];
    var points2 = <LatLng>[
      new LatLng(21.2441408, 81.6319132),
      new LatLng(21.2481669, 81.6181695),
    ];
    var points3 = <LatLng>[
      new LatLng(21.2441408, 81.6319132),
      new LatLng(
        21.2393569,
        81.6131813,
      ),
    ];
    var points4 = <LatLng>[
      new LatLng(
        21.2393569,
        81.6131813,
      ),
      new LatLng(21.252193, 81.6044256),
    ];
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
                    minZoom: 10,
                    maxZoom: 20,
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
                      Marker(
                          point: LatLng(21.252193, 81.6044256),
                          builder: (_) {
                            return GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/locationGreen.png',
                                ));
                          })
                    ],
                  ),
                  PolylineLayer(
                    polylines: [
                      new Polyline(
                          points: points,
                          strokeWidth: 5,
                          color: Colors.blue.shade400),
                      new Polyline(
                          points: points2,
                          strokeWidth: 5,
                          color: Colors.red.shade400),
                      new Polyline(
                          points: points3,
                          strokeWidth: 5,
                          color: Colors.green.shade400),
                      new Polyline(
                          points: points4,
                          strokeWidth: 5,
                          color: Colors.green.shade400)
                    ],
                  )
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 60,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Column(
                      children: [
                         ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchingCab(
                                          wheelChairSelected:
                                              widget.wheelChairSelected,
                                          onboardingSelected:
                                              widget.onboardingSelected,
                                          signSelected: widget.signSelected,
                                          pickUp: widget.pickUp,
                                          destination: widget.destination)));
                            },
                            child: Text('Get Rides'))
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
                     
                    ],
                  )))
        ],
      ),
    );
  }
}
