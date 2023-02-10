import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../helper/api.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.api}) : super(WeatherInitial());
  Api api;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherFetching());
    try {
      weatherModel = await api.get(
          uri:
              'https://weatherapi-com.p.rapidapi.com/current.json?q=$cityName&rapidapi-key=3cd3e5ad44msh3ef0964c11a79a7p10cb35jsn40763f18fa41');
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      print(e);
      emit(WeatherFailure());
    }
  }
}
