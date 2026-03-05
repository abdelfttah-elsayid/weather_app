import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_state.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final weatherModel = state.weatherModel;
          final themeColor = getContainerGradient(weatherModel.weatherCondition);

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [themeColor[500]!, themeColor[200]!, themeColor[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(weatherModel.cityName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                  Text('Updated at: ${weatherModel.date.hour}:${weatherModel.date.minute.toString().padLeft(2, '0')}'),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network("https:${weatherModel.image}"),
                      Text("${weatherModel.temp.toInt()}°", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48)),
                      Column(
                        children: [
                          Text("Max: ${weatherModel.maxTemp.toInt()}°"),
                          Text("Min: ${weatherModel.minTemp.toInt()}°"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(weatherModel.weatherCondition, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
MaterialColor getContainerGradient(String? condition) {
  if (condition == null) return Colors.blue;

  String cond = condition.toLowerCase();

  // 1. حالات الشمس والصفاء
  if (cond == 'sunny' || cond == 'clear') {
    return Colors.orange;
  }

  // 2. حالات الغيوم والضباب
  else if (cond.contains('cloudy') ||
      cond.contains('overcast') ||
      cond.contains('mist') ||
      cond.contains('fog')) {
    return Colors.blueGrey;
  }

  // 3. حالات الأمطار والرعد
  else if (cond.contains('rain') ||
      cond.contains('drizzle') ||
      cond.contains('showers') ||
      cond.contains('thunder')) {
    return Colors.blue;
  }

  else if (cond.contains('snow') ||
      cond.contains('sleet') ||
      cond.contains('blizzard') ||
      cond.contains('ice')) {
    return Colors.lightBlue;
  }

  // الحالة الافتراضية
  else {
    return Colors.blue;
  }
}