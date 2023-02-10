import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../cubits/weather_cubit/weather_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: ((context, state) {
          if (state is WeatherFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherFailure) {
            return Center(child: Text('Something went wrong please try again'));
          } else if (state is WeatherSuccess) {
            weatherModel = state.weatherModel;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      weatherModel!.cityName,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Text('Updated on: ${weatherModel!.date.split(' ')[0]}'),
                    const SizedBox(height: 5),
                    Text('At time: ${weatherModel!.date.split(' ')[1]}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('https:${weatherModel!.imgUrl}'),
                    // Text(
                    //   '${weatherModel!.avgTemp}',
                    //   style: const TextStyle(fontSize: 20),
                    // ),
                    Column(
                      children: [
                        Text('temp: ${weatherModel!.temp}'),
                        //Text('max: ${weatherModel!.maxTemp}'),
                      ],
                    ),
                  ],
                ),
                Text(
                  weatherModel!.condition,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}



/*


 */
