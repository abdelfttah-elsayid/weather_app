import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:wheather_app/models/weatherModel.dart';
import 'package:wheather_app/services/weather_services.dart';
import 'package:dio/dio.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel; // تمت إزالة late وإضافة ?

  Future<void> getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}