import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:wheather_app/views/searchView.dart';
import 'package:wheather_app/widgets/weatherInfBody.dart';

import 'models/weatherModel.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const HomeViewWrapper(),
      ),
    );
  }
}

class HomeViewWrapper extends StatelessWidget {
  const HomeViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {

        // بنحدد الموديل بناءً على الـ state الحالية
        WeatherModel? weather;
        if (state is WeatherLoadedState) {
          weather = state.weatherModel;
        }

        // بنجيب الألوان بناءً على حالة الطقس اللي جاية من الـ API
        final themeColors = getThemeColors(weather?.weatherCondition);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather App'),
            backgroundColor: themeColors.appBarColor, // اللون هيتغير هنا
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Searchview()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(WeatherState state) {
    if (state is WeatherInitialState) {
      return const Center(child: Text("there is no weather 😔 start searching now 🔍"));
    } else if (state is WeatherLoadedState) {
      return const WeatherInfoBody(); // هنا هيعرض بيانات الطقس
    } else if (state is WeatherFailureState) {
      return const Center(child: Text("Oops! there was an error"));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}class ThemeColors {
  final Color appBarColor;
  final Color backgroundColor;
  ThemeColors({required this.appBarColor, required this.backgroundColor});
}

ThemeColors getThemeColors(String? condition) {
  MaterialColor color = getContainerGradient(condition);

  return ThemeColors(
    appBarColor: color[700]!, // لون غامق للأب بار
    backgroundColor: color[100]!, // لون فاتح للخلفية
  );
}