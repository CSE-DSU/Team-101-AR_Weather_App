//instance for getting the api response

class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  int? feelsLike;
  // int? pressure;
  int? humidity;
  double? uvi;
  // int? clouds;
  int? visibility;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    // this.pressure,
    this.humidity,
    this.uvi,
    // this.clouds,
    this.visibility,
    this.windSpeed,
    // this.windDeg,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json['dt'] as int?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
        temp: (json['temp'] as num?)?.toDouble(),
        feelsLike: (json['feels_like'] as num?)?.round(),
        // pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        // clouds: json['clouds'] as int?,
        visibility: (json['visibility'] as int?)?.toInt(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        // windDeg: json['wind_deg'] as int?,
        // windGust: (json['wind_gust'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp,
        'feels_like': feelsLike,
        // 'pressure': pressure,
        'humidity': humidity,
        'uvi': uvi,
        // 'clouds': clouds,
        'visibility': visibility,
        'wind_speed': windSpeed,
        // 'wind_deg': windDeg,
        // 'wind_gust': windGust,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
