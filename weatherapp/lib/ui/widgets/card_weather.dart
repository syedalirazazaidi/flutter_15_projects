import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/constants/appString.dart';
import 'package:weatherapp/core/models/weather.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard(this.weather);
  DayWeather? weather;

  @override
  Widget build(BuildContext context) {
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
                            '${weather != null ? weather?.temperature : Container()}\u00B0 ',
                            style: TextStyle(
                              fontSize: 33,
                                  color: Colors.brown
                            ),
                          ),
                        ),
                      ),

                      //   child: Text(
                      //     '${weather != null ? weather?.temperature : Container()} ',
                      //     style: TextStyle(
                      //       // fontSize: 22,
                      //
                      //
                      //       color: Colors.black26,
                      //     ),
                      //     textAlign: TextAlign.start,
                      //   ),

                      // )
                      // Container(
                      //
                      //   child: Text(
                      //     '${weather != null ? weather?.temperature : Container()} ',
                      //     style: TextStyle(
                      //       // fontSize: 22,
                      //
                      //
                      //       color: Colors.black26,
                      //     ),
                      //     textAlign: TextAlign.start,
                      //   ),
                      //
                      //
                      //
                      // ),

                      Container(
                        margin: EdgeInsets.only(right: 50.0),
                        child: Text(
                          '${weather != null ? weather?.description : Container()} ',
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
                              "${AppStrings.Country} |${weather != null ? weather?.country : Container()}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            leading: Icon(Icons.flag_outlined),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text(
                              "${AppStrings.City} | ${weather != null ? weather?.cityName : Container()}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(Icons.air),
                            title: Text(
                              "${AppStrings.Wind} | ${weather != null ? weather?.wind : Container()}km/h",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(
                              Icons.water_damage_outlined,
                            ),
                            title: Text(
                              "${AppStrings.Humidity} | ${weather != null ? weather?.humidity : Container()}%",
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
