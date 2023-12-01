import 'dart:async';
import 'dart:typed_data';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class GoogleMapDcreen extends StatefulWidget {
  const GoogleMapDcreen({super.key});

  @override
  State<GoogleMapDcreen> createState() => _GoogleMapDcreenState();
}

class _GoogleMapDcreenState extends State<GoogleMapDcreen> {
  @override
  void initState() {
    // todo : implement initState
    super.initState();
    // markes.addAll(markesList);
    loadData();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final CameraPosition initialPosition =
      CameraPosition(target: LatLng(21.170240, 72.831062), zoom: 15);

  /// custom window controler
  CustomInfoWindowController customInfoWindow = CustomInfoWindowController();

  late List<LatLng> latLogs = [
    LatLng(21.170240, 72.831062),
    LatLng(21.170241, 72.83911),
    LatLng(21.169240, 72.840062),
    LatLng(21.17031, 72.8499),
    LatLng(21.17045, 72.8399),
    LatLng(21.17050, 72.82551),
  ];
  List<String> images = [
    "assets/images/img_image_1.png",
    "assets/images/img_image_2.png",
    "assets/images/img_image_3.png",
    "assets/images/img_image_4.png",
    "assets/images/img_image_5.png",
    "assets/images/img_image_6.png",
    "assets/images/img_image_7.png",
    "assets/images/img_image_8.png",
    "assets/images/img_image_9.png",
  ];
  late List<Marker> markes = [];
  late List<Marker> markesList = [
    Marker(
        markerId: MarkerId("1"),
        position: latLogs[0],
        infoWindow: InfoWindow(
          title: "Current",
        )),
    Marker(
        markerId: MarkerId("2"),
        position: latLogs[1],
        infoWindow: InfoWindow(
          title: "Latest Positoin",
        )),
  ];
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    // final byte = (await rootBundle.load(path)).buffer.asUint8List();
    // return byte;

    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: 100);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> loadData() async {
    for (int i = 0; i < latLogs.length; i++) {
      final Uint8List markerIcon = await getBytesFromAsset(images[i], 120);
      print("markerIcon--$markerIcon");

      markes.add(Marker(
          markerId: MarkerId("$i"),
          position: latLogs[i],
          infoWindow: InfoWindow(title: "Title-$i"),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
            customInfoWindow.addInfoWindow!(
                Container(
                  height: 140,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.orange, width: 1.3)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              images[i],
                              fit: BoxFit.cover,
                              height: 100,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "hey-$i",
                        ),
                      ),
                    ],
                  ),
                ),
                latLogs[i]);
          }));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialPosition,
            markers: Set<Marker>.of(markes),
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              // _controller.complete(controller); ///for the map controller when info window not add
              customInfoWindow.googleMapController = controller;
            },
            onTap: (position) {
              customInfoWindow.hideInfoWindow!();
            },
            onCameraMove: (position) {
              customInfoWindow.onCameraMove!();
            },
          ),
          CustomInfoWindow(
            controller: customInfoWindow,
            height: 75,
            width: 150,
            offset: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final GoogleMapController mapController = await _controller.future;
          // mapController.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(target: LatLng(21.1710, 72.8411), zoom: 13)));
          final position = await getCurrentPosition();
          if (position != null) {
            mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));
            setState(() {});
          }
        },
        child: Icon(Icons.location_on_outlined),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              color: Colors.black87,
            )),
            ElevatedButton(
                onPressed: () {
                  getAddress(LatLng(21.124, 72.794));
                },
                child: Text("Get Address")),
            ElevatedButton(
                onPressed: () {
                  getLatLon();
                },
                child: Text("Get LatLong")),
          ],
        ),
      ),
    );
  }

  Future<Position?> getCurrentPosition() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition();
    if (position == null) {
      return null;
    }
    markes.add(Marker(
        markerId: MarkerId("valueas"),
        infoWindow: InfoWindow(title: "Tap to Find"),
        position: LatLng(position.latitude, position.longitude)));
    return position;
  }

  Future<void> getAddress(LatLng latLng) async {
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final address = placeMarks[0];
    print(
        "Address==\n${address.street},${address.locality},${address.administrativeArea}");
  }

  Future<void> getLatLon() async {
    List<Location> locations =
        await locationFromAddress("kantareshwar mahadev katargam surat");
    final latlog = locations[0];
    markes.add(Marker(
        markerId: MarkerId("Current position as"),
        infoWindow: InfoWindow(title: "Current Position"),
        position: LatLng(latlog.latitude, latlog.longitude)));
    final GoogleMapController map = await _controller.future;
    map.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latlog.latitude, latlog.longitude), zoom: 14)));

    setState(() {});
  }
}
