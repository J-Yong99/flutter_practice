import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(position);
    } catch (e) {
      print('there was an error');
    }
  }
}

void main() async {
  MyLocation loc = MyLocation();
  await loc.getMyCurrentLocation();
  print(loc.latitude2);
}
