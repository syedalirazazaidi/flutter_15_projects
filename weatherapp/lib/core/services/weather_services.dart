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
    final  decodeData=jsonDecode(response.body);
// print(decodeData);
    final parseData = decodeData.isNotEmpty?decodeData:{};
// print(parseData);
    // final parseData = jsonDecode(response.body) ??'';
    final temperature = parseData["main"]['temp']??'';
    final humidity = parseData["main"]['humidity']??'';
    final wind = parseData["wind"]['speed']??'';
    final country=parseData["sys"]['country']??'';
    final description=parseData['weather'][0]['description']??'';
    final cityName=parseData["name"]??'';


    // print(parseData);
    return DayWeather(country: country,humidity: humidity,wind: wind,temperature: temperature,description: description,cityName:cityName);


  }
  void getLocation()async{
    print('Fetching location in progress');
    http.Response locationCity = await http.get(Uri.parse('${Configs.locationApi}?lat=${lat}&lon=${lon}&appid=${Configs.apiKey}'));
print('get location completed');
   // final response = await http.get(locationCity);

   if (locationCity.statusCode != 200 || locationCity==null) {
     throw Exception('Error Fetching location from server');
   }
    final  locationData=jsonDecode(locationCity.body);
   print(locationData);
  }
}
// =${city}&appid=${apiKey}
