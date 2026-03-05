import 'package:flutter/material.dart';
import 'package:wheather_app/models/weatherModel.dart';

class ThemeColors {
  final Color appBarColor;
  final Color backgroundColor;
  final MaterialColor primaryColor;
  ThemeColors({required this.appBarColor, required this.backgroundColor, required this.primaryColor});
}

ThemeColors getThemeColors(WeatherModel? weather) {
  if (weather == null) {
    return ThemeColors(
        appBarColor: Colors.blue,
        backgroundColor: Colors.white,
        primaryColor: Colors.blue
    );
  }

  MaterialColor color;
  double temp = weather.temp;
  String condition = weather.weatherCondition.toLowerCase();

  // منطق الألوان بناءً على الحرارة والحالة
  if (condition.contains('thunder')) {
    color = Colors.deepPurple;
  } else if (temp <= 10) {
    color = Colors.cyan; // برد قارس (7 درجات مثلاً)
  } else if (temp > 10 && temp <= 18) {
    color = Colors.lightBlue; // جو شتوي
  } else if (temp > 18 && temp <= 24) {
    color = Colors.teal; // جو ربيعي لطيف
  } else if (temp > 24 && temp <= 30) {
    color = Colors.orange; // جو دافئ
  } else {
    color = Colors.deepOrange; // جو حار جداً
  }

  return ThemeColors(
    appBarColor: color[800]!,
    backgroundColor: color[100]!,
    primaryColor: color,
  );
}