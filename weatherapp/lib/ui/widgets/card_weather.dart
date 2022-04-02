import 'package:flutter/material.dart';
import 'package:weatherapp/constants/appString.dart';
import 'package:weatherapp/core/models/weather.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard(this.weather);
  DayWeather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              width: 342,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    ListTile(
                      title: Text(
                        "${AppStrings.Country} ${weather != null ? weather?.country : Container()}",
                      ),

                    ),
                    Icon(
                      Icons.flag_outlined,
                      color: Colors.teal,
                    ),
                    ListTile(
                      title: Text(
                        "${AppStrings.City} ${weather != null ? weather?.cityName : Container()}",
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "${AppStrings.Wind} ${weather != null ? weather?.wind : Container()}",
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "${AppStrings.Humidity} ${weather != null ? weather?.humidity : Container()}",
                      ),
                    ),
                  ],
                ),
                elevation: 8,
                shadowColor: Colors.grey.shade200,
                margin: EdgeInsets.all(5),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
