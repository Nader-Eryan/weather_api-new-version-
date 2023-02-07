import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: const Color.fromARGB(255, 43, 215, 198),
          backgroundColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
