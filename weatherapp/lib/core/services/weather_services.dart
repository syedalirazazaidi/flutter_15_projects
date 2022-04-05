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
    final decodeData = jsonDecode(response.body);

    final parseData = decodeData.isNotEmpty ? decodeData : {};

    final temperature = parseData["main"]['temp'] ?? '';
    final humidity = parseData["main"]['humidity'] ?? '';
    final wind = parseData["wind"]['speed'] ?? '';
    final country = parseData["sys"]['country'] ?? '';
    final description = parseData['weather'][0]['description'] ?? '';
    final cityName = parseData["name"] ?? '';

    return DayWeather(
        country: country,
        humidity: humidity,
        wind: wind,
        temperature: temperature,
        description: description,
        cityName: cityName);
  }

  Future<DayWeather?> getLocation(latitude, longitude) async {
    if (latitude != null && longitude != null) {
      print('get location in process $latitude ,$longitude');

      http.Response locationCity = await http.get(Uri.parse(
          // 'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${Configs.apiKey}'
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=9992d178cf439a1c5e213b04853970bc'
      ));

      if (locationCity.statusCode != 200 || locationCity == null) {
        throw Exception('Error Fetching location from server');
      }

      final locationData = jsonDecode(locationCity.body);
      // print('locationData $locationData');
      final parseData = locationData.isNotEmpty ? locationData : {};
      print('parseData $parseData');
      final temperature = parseData["main"]['temp'] ?? '';
      final humidity = parseData["main"]['humidity'] ?? '';
      final wind = parseData["wind"]['speed'] ?? '';
      final country = parseData["sys"]['country'] ?? '';
      final description = parseData['weather'][0]['description'] ?? '';
      final cityName = parseData["name"] ?? '';

      return DayWeather(
          country: country,
          humidity: humidity,
          wind: wind,
          temperature: temperature,
          description: description,
          cityName: cityName);
    }
  }
}

