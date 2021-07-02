import 'package:geolocator/geolocator.dart';

class Locate {
  double? lati;
  double? long;

  Future<void> getLocate() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lati = position.latitude;
      long = position.longitude;
    } catch (e) {
      print('error catched!!');
    }
  }
}
