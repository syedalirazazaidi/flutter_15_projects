import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weatherapp/constants/appString.dart';
import 'package:weatherapp/core/models/weather.dart';
import 'package:weatherapp/core/services/weather_services.dart';
import 'package:weatherapp/ui/widgets/card_weather.dart';
import 'package:weatherapp/ui/widgets/custom_search.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService _weatherService = WeatherService();
  String cityName = '';
  DayWeather? cityweather;

  @override
  void initState() {}

  void updateUI(String value) async {
    setState(() {
      cityName = value;
    });

    final response = await _weatherService.getData(cityName);
    // print('${cityweather!=null? {
    //     cityweather?.description
    //   } :Container()}..,WEATHER');
    setState(() {
      cityweather = response;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(AppStrings.AppBarTitle,
                      style: Theme.of(context).textTheme.headline3),
                ),
                WeatherCard(cityweather),
                // cityweather!=null? WeatherCard(cityweather!):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
