import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/constants/appString.dart';
import 'package:weatherapp/constants/errorString.dart';
import 'package:weatherapp/core/models/weather.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard(this.weather, this.isLoading);
  DayWeather? weather;
  bool isLoading;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Container(
      child: SizedBox(
        height: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              width: 342,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 46.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 43.0),
                        child: SizedBox(
                          height: 40,
                          child: Text(
                            '${weather != null ?
                            isLoading?AppStrings.Searching: weather?.temperature != null ?'${weather?.temperature}\u00B0':ErrorStrings.na:''} ',
                            style: TextStyle(fontSize: 33, color: Colors.brown),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 50.0),
                        child: Text(
                          '${weather != null ? weather?.description : ''} ',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                      // SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              "${AppStrings.Country} |${weather != null ? weather?.country : ''}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            leading: Icon(Icons.flag_outlined),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text(
                              "${AppStrings.City} | ${weather != null ? weather?.cityName : ''}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(Icons.air),
                            title: Text(
                              "${AppStrings.Wind} | ${weather != null ? weather?.wind : ''}km/h",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(
                              Icons.water_damage_outlined,
                            ),
                            title: Text(
                              "${AppStrings.Humidity} | ${weather != null ? weather?.humidity : ''}%",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      )
                    ],
                  ),
                ),
                elevation: 8,
                shadowColor: Colors.grey.shade200,
                margin: EdgeInsets.all(5),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
