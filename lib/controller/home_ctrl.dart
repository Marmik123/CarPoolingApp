import 'package:car_pooling_app/model/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeScreenCtrl extends GetxController {
  Future<void> getCurrentUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    await Geolocator.openLocationSettings();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final staticMapUrl = LocationHelper.staticMapImageUrl(
        latitude: position.latitude, longitude: position.longitude);
    print("eeeeee" + staticMapUrl);
    /*   setState(() {
      _previewImageUrl = staticMapUrl;
    });*/
  }

  Future<void> selectOnMap() async {
    /*final LatLng selectedLocation = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapsScreen()));*/

    /*if (selectedLocation == null) {
      return;
    }
    print(selectedLocation.latitude);
  }*/
  }
}
