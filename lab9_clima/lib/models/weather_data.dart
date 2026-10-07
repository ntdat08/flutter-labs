class WeatherData {
  final String name;
  final String country;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final double tempMin;
  final double tempMax;
  final int weatherId;
  final String main;
  final String description;
  final String icon;
  final double windSpeed;
  final int windDeg;
  final int dt;
  final int timezone;

  WeatherData({
    required this.name,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.tempMin,
    required this.tempMax,
    required this.weatherId,
    required this.main,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.windDeg,
    required this.dt,
    required this.timezone,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'] ?? 'Unknown',
      country: json['sys']?['country'] ?? '',
      sunrise: json['sys']?['sunrise'] ?? 0,
      sunset: json['sys']?['sunset'] ?? 0,
      temp: (json['main']?['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json['main']?['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: json['main']?['humidity'] ?? 0,
      pressure: json['main']?['pressure'] ?? 0,
      tempMin: (json['main']?['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['main']?['temp_max'] as num?)?.toDouble() ?? 0.0,
      weatherId: json['weather']?[0]?['id'] ?? 800,
      main: json['weather']?[0]?['main'] ?? 'Clear',
      description: json['weather']?[0]?['description'] ?? 'Trời quang đãng',
      icon: json['weather']?[0]?['icon'] ?? '01d',
      windSpeed: (json['wind']?['speed'] as num?)?.toDouble() ?? 0.0,
      windDeg: json['wind']?['deg'] ?? 0,
      dt: json['dt'] ?? 0,
      timezone: json['timezone'] ?? 0,
    );
  }
}