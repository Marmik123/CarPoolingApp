import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/model/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  bool isSelecting;

  HomeScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 21.1855485, longitude: 72.7831793),
      this.isSelecting = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng pickedLocation;

  void selectLocation(LatLng position) {
    setState(() {
      widget.isSelecting = true;
      pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.initialLocation.latitude,
                  widget.initialLocation.longitude),
              zoom: 16,
            ),
            onTap: widget.isSelecting ? null : selectLocation,
            markers: pickedLocation == null
                ? null
                : {
                    Marker(
                      markerId: MarkerId('m1'),
                      position: pickedLocation,
                    )
                  },
          ),
          BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Column(
                  children: [
                    TextFormField(
                      style: kStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      //controller: signUpCtrl.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter a value";
                        } else
                          return null;
                      },
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: " Enter Source",
                        hintStyle: kStyle.copyWith(
                          fontSize: 18,
                          color: kSplash.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: kStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      //controller: signUpCtrl.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter a value";
                        } else
                          return null;
                      },
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: "Enter Destination",
                        hintStyle: kStyle.copyWith(
                          fontSize: 18,
                          color: kSplash.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
