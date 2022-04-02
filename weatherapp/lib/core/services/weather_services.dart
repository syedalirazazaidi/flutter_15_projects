import 'package:weatherapp/constants/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/core/models/weather.dart';

class WeatherService {
  Future<DayWeather> getData(String city) async {
    Uri url = Uri.parse('${Configs.baseUrl}=${city}&appid=${Configs.apiKey}');
    print('Fetching data in progress');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error Fetching data from server');
    }
    final parseData = jsonDecode(response.body) ??'';
    final temperature = parseData["main"]['temp']??'';
    final humidity = parseData["main"]['humidity']??'';
    final wind = parseData["wind"]['speed']??'';
    final country=parseData["sys"]['country']??'';
    final description=parseData['weather'][0]['description']??'';
    final cityName=parseData["name"]??'';


    print(parseData['name']);
    return DayWeather(country: country,humidity: humidity,wind: wind,temperature: temperature,description: description,cityName:cityName);

    //

    // print(parseData["main"]['temp']);
    // print(parseData["main"]['humidity']);
    // print(parseData["wind"]['speed']);
    //
    // print(parseData["sys"]['country']);
    // print('Fetching data completed');
    // {temp: 297.05, feels_like: 296.8, temp_min: 297.05, temp_max: 297.05, pressure: 1009, humidity: 50}
    // country ,
    // city,
    // wind,
    // humidity
    // Uri url = Uri.parse(
    //     'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=9992d178cf439a1c5e213b04853970bc');
    // final response = await http.get(url);
    // print(response.body);
  }
}
// =${city}&appid=${apiKey}
