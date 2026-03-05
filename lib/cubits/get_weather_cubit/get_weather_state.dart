
import 'package:wheather_app/models/weatherModel.dart';

class WeatherState{

}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
   final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});

}
class WeatherFailureState extends WeatherState {
  final String errorMessage= 'oops there is an error';

  WeatherFailureState();

}

