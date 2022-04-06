import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  TextEditingController? controller = TextEditingController();
  void configLoader() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.grey.shade500
      ..backgroundColor = Colors.blueGrey.shade900
      ..indicatorColor = Colors.amber
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  void showLoader() {
    EasyLoading.show(status: AppStrings.loading);
  }

  void dismissLoader() {
    EasyLoading.dismiss();
  }

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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.best);
  }

  // Future<Position> getCurrentLocation() async {
  //
  //       Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best);
  //   return position;
  // }

  @override
  void initState() {
    super.initState();
    // _determinePosition();
      configLoader();
     toggleIsLoading();
    _determinePosition().then((position) {
      print(position);
      _weatherService
          .getLocation(position.latitude, position.longitude)
          .then((data) {
            setState(() {
              cityweather = data;
            });
          })
          .catchError((error) => print(error.toString()))
          .whenComplete(() => toggleIsLoading());
    });
  }

  void toggleIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
    if (isLoading) {
      showLoader();
    } else {
      dismissLoader();
    }
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
    controller?.clear();
    toggleIsLoading();
  }

  @override
  Widget build(BuildContext context) {
    //build function run every update
    // initState() this lifecycle event call only ones
    // didUpdateWidget() use this widget if you want to compare the new widget and the old one
    // deactivate() this method can be call some state is removed from the tree temporarily or permanently
    // dispose() this method can be call some state is removed from the tree temporarily
    //in dart we have single tone object

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                CustomSearch(onSubmit: updateUI, controller: controller),
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
