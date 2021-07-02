import 'package:fprc/geo.dart';
import 'package:fprc/gjason.dart';

const apikey = '39a902bc47604990d067faeca06e78d3';

class AirPollution extends Locate {
  Future<void> getAirpollution() async {
    await super.getLocate();
    Network network = Network(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=${this.lati}&lon=${this.long}&appid=$apikey');
    var airdata = await network.getJasonData();
    print(airdata);
  }
}
