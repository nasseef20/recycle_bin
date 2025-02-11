//This just uses a dummy image of a map to demonstrate the actual intent.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
   Future<void> _getLocationAndOpenMap() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.no_location_services,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }


    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.no_location_permission,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
    }

    //current location
    try {

      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );


      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      String origin = '${position.latitude},${position.longitude}';
      String destination = '23.72625,90.39806'; 

      String url = 'https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination';


      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {

        Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.no_google_map,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {

      Fluttertoast.showToast(
        msg: "Failed to get location: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.map_app_bar),  elevation: 20.0,),
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap:_getLocationAndOpenMap,
              child: Image.asset(
                'assets/dummy_map.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
        ],
      )
    );
  }
}