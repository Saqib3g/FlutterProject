//flutter pub add google_maps_flutter


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapSample extends StatefulWidget {
  const GoogleMapSample({super.key});

  @override
  State<GoogleMapSample> createState() => _GoogleMapSampleState();
}

class _GoogleMapSampleState extends State<GoogleMapSample> {
  GoogleMapController? _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(17.3850, 78.4867),
          zoom: 1,
        ),
        markers: markers.values.toSet(),
        mapToolbarEnabled: true,
        mapType: MapType.terrain,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    final marker = Marker(
      markerId: MarkerId('2'),
      position: LatLng(9.669111, 80.014007),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    final thub = Marker(
      markerId: MarkerId('1'),
      position: LatLng(17.4375, 78.4482),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'Ameerpet',
        snippet: 'jc',
      ),
    );

    setState(() {
      markers[MarkerId('1')] = thub;
      markers[MarkerId('2')] = marker;
    });
  }
}

// in AndroidManifest.xml file , after <application> tag add 
//<meta-data android:name="com.google.android.geo.API_KEY" 
//android:value="AIzaSyBkPWjDYmvdPXb_JBemn_L3siE8z6JXpmc"/>


// in AppDelegate.swift file 
// import GoogleMaps
// and after GeneratedPluginRegistrant add 
//  GMSServices.provideAPIKey("AIzaSyBkPWjDYmvdPXb_JBemn_L3siE8z6JXpmc")
