import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  //static String baseUri = 'http://api.weatherapi.com/v1';  old url
  static String baseUri = 'https://weatherapi-com.p.rapidapi.com/current.json?';
  static String apiKey = '3cd3e5ad44msh3ef0964c11a79a7p10cb35jsn40763f18fa41';
  static Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('${baseUri}q=$cityName&rapidapi-key=$apiKey');
    http.Response response = await http.get(url);
    print(response.statusCode);
    dynamic data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    print('=====================================');
    print(data);
    print('=====================================');
    return weather;
  }
}
