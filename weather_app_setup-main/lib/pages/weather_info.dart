// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  WeatherInfo({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(weatherModel!.cityName)),
        body: Column(
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
        ));
  }
}
