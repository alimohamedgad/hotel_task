import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/app_image/app_image.dart';
import 'google_map_screen.dart';

class BottomNavGoogleMap extends StatefulWidget {
  const BottomNavGoogleMap({
    super.key,
  });

  @override
  State<BottomNavGoogleMap> createState() => _BottomNavGoogleMapState();
}

class _BottomNavGoogleMapState extends State<BottomNavGoogleMap> {
  @override
  // static Position? position;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const GoogleMapScreen();
            },
          ),
        );
        //! Here with bottom sheet can not be scroll
        // showModalBottomSheet(
        //     context: context,
        //     isScrollControlled: true,
        //     useSafeArea: true,
        //     builder: (context) {
        //       return buildGoogleMap();
        //     });
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.white,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 122),
        padding: EdgeInsets.zero,
        child: Image.asset(
          AppImage.googleMap,
        ),
      ),
    );
  }
}

Widget buildGoogleMap() {
  return const GoogleMap(
    initialCameraPosition: CameraPosition(
      tilt: 0.0,
      bearing: 0.0,
      zoom: 17,
      target: LatLng(37.43296265331129, -122.08832357078792),
    ),
    mapType: MapType.normal,
    myLocationButtonEnabled: true,
    myLocationEnabled: true,
    zoomControlsEnabled: false,
  );
}
