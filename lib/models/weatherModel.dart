class WeatherModel {
  String cityName;
  DateTime date;
  String? image;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: (json['forecast']['forecastday'][0]['day']['avgtemp_c'] as num).toDouble(),
      maxTemp: (json['forecast']['forecastday'][0]['day']['maxtemp_c'] as num).toDouble(),
      minTemp: (json['forecast']['forecastday'][0]['day']['mintemp_c'] as num).toDouble(),
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}