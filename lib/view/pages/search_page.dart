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
    const Marker(
        position: LatLng(44.5038128154261, 11.340519260461816),
        markerId: MarkerId("test9")),
    const Marker(
        position: LatLng(44.49887807298449, 11.33857713368443),
        markerId: MarkerId("test8")),
    const Marker(
        position: LatLng(44.493077052228685, 11.355327977139389),
        markerId: MarkerId("test7")),
    const Marker(
        position: LatLng(44.49099893426057, 11.353143084514828),
        markerId: MarkerId("test6")),
    const Marker(
        position: LatLng(44.498964651012884, 11.339184048302362),
        markerId: MarkerId("test5")),
    const Marker(
        position: LatLng(44.47835545457174, 11.342218621392028),
        markerId: MarkerId("test4")),
    const Marker(
        position: LatLng(44.48692907207651, 11.371836054747176),
        markerId: MarkerId("test3")),
    const Marker(
        position: LatLng(44.496800161735706, 11.345981492023217),
        markerId: MarkerId("test2")),
    const Marker(
        position: LatLng(44.493856327376086, 11.324375331624788),
        markerId: MarkerId("test"))
  };

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(44.496800161735706, 11.341126175079747),
          zoom: 12,
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
    ]);
  }
}
