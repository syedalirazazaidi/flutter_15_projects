class Weather {
  Weather({
    // required this.coord,
    // required this.weather,
    required this.base,
    // required this.main,
    required this.visibility,
    // required this.wind,
    // required this.clouds,
    // required this.dt,
    // required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  // Coord coord;
  // List<WeatherElement> weather;
  String base;
  // Main main;
  int visibility;
  // Wind wind;
  // Clouds clouds;
  // int dt;
  // Sys sys;
  int timezone;
  int id;
  String name;
  int cod;
}