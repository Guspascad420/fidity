import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:fidity/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fidity/models/user_location.dart';

class FidityMap extends StatefulWidget {
  const FidityMap({super.key});

  @override
  State<FidityMap> createState() => _FidityMapState();
}

class _FidityMapState extends State<FidityMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final Set<UserLocation> _userLocations = UserLocation.getLocations();
  BitmapDescriptor _disabledMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _guardianIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> _markers = {};
  var _userCurrentLocation;
  var _street = "";
  var _subAdministrativeArea = "";

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void _addCustomIcon() async {
    var disabledIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "images/pin_map.png"
    );
    var guardianIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "images/pin_map_3.png"
    );
    setState(() {
      _disabledMarkerIcon = disabledIcon;
      _guardianIcon = guardianIcon;
    });
    _markers = _userLocations.map((location) =>
        Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(
              title: location.name,
              snippet: location.address,
            ), // InfoWindow
            icon: location.category == Category.disability
                ? _disabledMarkerIcon : _guardianIcon
        )
    ).toSet();
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> _getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    var location = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude,
        location.longitude);
    Placemark place1 = placemarks[0];
    setState(() {
      _userCurrentLocation = location;
      _street = place1.street!;
      _subAdministrativeArea = place1.subAdministrativeArea!;
    });
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                  _userCurrentLocation.latitude,
                  _userCurrentLocation.longitude
              ), zoom: 14.4746,
            )
        )
    );
  }

  Future<void> _goToUserLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 18,
            )
        )
    );
  }

  @override
  void initState() {
    _addCustomIcon();
    super.initState();
    _getCurrentLocation().then((value) {
      _goToCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _goToCurrentLocation,
        child: SvgPicture.asset('images/gps.svg'),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Theme.of(context).colorScheme.onPrimary,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Lokasi kamu saat ini',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600
                  )
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                    _street,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              const SizedBox(height: 5),
              Text(
                  _subAdministrativeArea,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey,
                  )
              ),
            ]
        ),
      )
    );
  }

}