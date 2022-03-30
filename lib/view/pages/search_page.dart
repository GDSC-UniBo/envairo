import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Completer<GoogleMapController> controller1;

  final Set<Marker> _markers = {
    const Marker(position: LatLng(40.6508946,16.1456264), markerId: MarkerId("test9")),
    const Marker(position: LatLng(42.0481283,14.709342), markerId: MarkerId("test8")),
    const Marker(position: LatLng(45.155062, 11.663693), markerId: MarkerId("test7")),
    const Marker(position: LatLng(44.4897103,11.3131531), markerId: MarkerId("test6")),
    const Marker(position: LatLng(40.1484675,9.0284305), markerId: MarkerId("test5")),
    const Marker(position: LatLng(37.7486814,14.8072024), markerId: MarkerId("test4")),
    const Marker(position: LatLng(45.1055772,9.7201355), markerId: MarkerId("test3")),
    const Marker(position: LatLng(42.1311128,11.9113219), markerId: MarkerId("test2")),
    const Marker(position: LatLng(41.9102415,12.3959112), markerId: MarkerId("test"))
  };

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(42.1311128,11.9113219),
              zoom: 5,
            ),
            onMapCreated: _onMapCreated,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: false,
          ),

          Padding(
            padding: EdgeInsets.only(top: 75.h, left: 25.w, right: 25.w),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search products",
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.sh),
                  borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                ),
                contentPadding: EdgeInsets.fromLTRB(30.0.w, 29.0.w, 30.0.w, 29.0.w),
              ),
            ),
          ),
        ]

    );
  }
}
