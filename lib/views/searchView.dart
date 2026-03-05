import 'package:flutter/material.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/models/weatherModel.dart';
import 'package:wheather_app/services/weather_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onSubmitted: (cityName) async {
            var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: cityName);                      Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search, color: Colors.blue),
              hintText: 'Please enter city name',
              hintStyle: TextStyle(color: Color(0xFF808080)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
