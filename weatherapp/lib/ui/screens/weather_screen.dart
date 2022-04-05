import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weatherapp/constants/appString.dart';
import 'package:weatherapp/core/models/weather.dart';
import 'package:weatherapp/core/services/weather_services.dart';
import 'package:weatherapp/ui/widgets/card_weather.dart';
import 'package:weatherapp/ui/widgets/custom_search.dart';
import 'package:geolocator/geolocator.dart';

import 'package:intl/intl.dart';
import 'package:weatherapp/ui/widgets/time_widget.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService _weatherService = WeatherService();
  String cityName = '';
  DayWeather? cityweather;
  bool isLoading = false;
  var day = DateFormat.d().format(DateTime.now());
  var month = DateFormat.LLLL().format(DateTime.now());

  // String _locality = '';
  // String _weather = '';
  // Future<Position> getPosition() async {
  //   Position position = await Geolocator
  //        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   return position;
  // }
  // Future<Placemark> getPlacemark(double latitude, double longitude) async {
  //   List<Placemark> placemark = await Geolocator.
  //       placemarkFromCoordinates(latitude, longitude);
  //   return placemark[0];
  // }
  Position? currentPosition;
  // _getCurrentLocation() {
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((position){
      print(position);
       _weatherService.getLocation(position.latitude, position.longitude).then((data){
         setState(() {
           cityweather = data;
         });
         // print('$data =========================');
       });
    }
    );

    // if (currentPosition != null) {
    //  _weatherService.getLocation(currentPosition?.latitude,currentPosition?.longitude);
    //   _getCurrentLocation();

    //
    // }

  }

  void toggleIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void updateUI(String value) async {
    changeFocus();
    toggleIsLoading();
    setState(() {
      cityName = value;
    });

    final response = await _weatherService.getData(cityName);

    setState(() {
      cityweather = response;
    });
    toggleIsLoading();
  }

  @override
  Widget build(BuildContext context) {
    // if (currentPosition != null) {
    //   print('${currentPosition?.latitude}currentposition');
    //   "LAT: ${currentPosition?.latitude}, LNG: ${currentPosition?.longitude}";
    // }

    //build function run every update
    // initState() this lifecycle event call only ones
    // didUpdateWidget() use this widget if you want to compare the new widget and the old one
    // deactivate() this method can be call some state is removed from the tree temporarily or permanently
    // dispose() this method can be call some state is removed from the tree temporarily

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                CustomSearch(onSubmit: updateUI),
                GetTime(day.toString(), month),
                WeatherCard(cityweather, isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
