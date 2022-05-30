class WeatherData{
  String condition;
  num temperature;
  num visibility;
  num pressure;
  num feelsLike;
  String humidity;
  num windSpeed;
  String country;
  String name;
  String icon;

  WeatherData({
    required this.condition,
    required this.country,
    required this.feelsLike,
    required this.humidity,
    required this.icon,
    required this.name,
    required this.pressure,
    required this.temperature,
    required this.visibility,
    required this.windSpeed
});

  factory WeatherData.fromJson(Map<String, dynamic> json){
    return WeatherData(
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp']).round(),
      feelsLike: (json['main']['feels_like']).round(),
      visibility: (json['visibility']/1000).round(),
      pressure: (json['main']['pressure']),
      humidity: json['main']['humidity'].toString(),
      windSpeed: (json['wind']['speed']*3.6),
      country: json['sys']['country'],
      name:json['name'],
      icon: json['weather'][0]['icon']
    );
  }
}