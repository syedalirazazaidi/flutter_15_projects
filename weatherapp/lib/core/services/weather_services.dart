// api key='9992d178cf439a1c5e213b04853970bc';
import 'package:weatherapp/constants/config.dart';
import 'package:weatherapp/core/models/weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService{
  Future<Weather?> getData() async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q={city name}&appid=9992d178cf439a1c5e213b04853970bc';
        // 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=9992d178cf439a1c5e213b04853970bc';
    // '${Configs.baseUrl}${word.trim()}?key=${Configs.apiKey}';
    http.Response response = await http.get(Uri.parse(url));
    print(response);


  }}

// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}