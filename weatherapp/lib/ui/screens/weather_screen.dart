import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weatherapp/core/models/weather.dart';
import 'package:weatherapp/core/services/weather_services.dart';
import 'package:weatherapp/ui/widgets/custom_input.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService weatherService = WeatherService();
  String cityWeather = '';

  @override
  void initState() {
    weatherService.getData()
        .then((Weather? value) {
      setState(() {
        // Weather = value;
      });
    })
        .catchError((onError) => print('error'));
    // super.initState();
  }
  void updateUI(String value) {
    setState(() {
      cityWeather = value;
      // city = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Weather App'),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: updateUI,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Search ...',
                      suffixIcon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 170,
                        width: 170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text(
                              "Codesinsider.com",
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.grey.shade200,
                          margin: EdgeInsets.all(5),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text("Codesinsider.com"),
                          ),
                          elevation: 8,
                          shadowColor: Colors.grey.shade300,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 170,
                      width: 347,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text("Codesinsider.com"),
                        ),
                        elevation: 8,
                        shadowColor: Colors.grey.shade300,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                  ],
                )
                // Container(
                //   height: 200,
                //   width: 200,
                //   child: Card(
                //     child: ListTile(
                //       title: Text("Codesinsider.com"),
                //     ),
                //     elevation: 8,
                //     shadowColor: Colors.green,
                //     margin: EdgeInsets.all(20),
                //   ),
                // )

                // Container(
                //   height: 160,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       // gradient: LinearGradient(
                //       //     colors: [Colors.brown, Colors.indigo.shade200],
                //       //     begin: Alignment.topLeft,
                //       //     end: Alignment.bottomRight),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.brown.shade100,
                //           blurRadius: 10,
                //           offset: Offset(0, 6),
                //         )
                //       ]
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
