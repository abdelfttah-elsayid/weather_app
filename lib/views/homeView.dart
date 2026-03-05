  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_state.dart';

  import 'package:wheather_app/views/searchView.dart';
import 'package:wheather_app/widgets/noWeatherBody.dart';
import 'package:wheather_app/widgets/weatherInfBody.dart';

  class Homeview extends StatefulWidget {
    const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();

}

class _HomeviewState extends State<Homeview> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Weather App',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).
                push(MaterialPageRoute(builder: (context){
                 return Searchview();
                },),);
              },
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
              body : BlocBuilder <GetWeatherCubit , WeatherState >(
                  builder: (context , state)
                  {
                    if(state is WeatherInitialState){
                      return NoWeatherBody();
                    }
                    else if (state is WeatherLoadedState)
                      {
                         return WeatherInfoBody();
                      }
                    else
                      {
                        return Text('oops there was an error');
                      }
                  }

              )
      );
    }
}

