import 'package:flutter/material.dart';
import 'package:th_project/data/my_location.dart';
import 'package:th_project/data/network.dart';
import 'package:th_project/screens/weather_screen.dart';

const apikey = '39a902bc47604990d067faeca06e78d3';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');
    var weatherData = await network.getJasonData();
    var airData = await network.getAirData();
    print(weatherData);
    print(airData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(
                parseWeatherData: weatherData, parseAirData: airData)));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            null;
          },
          child: Text(
            'get my location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
