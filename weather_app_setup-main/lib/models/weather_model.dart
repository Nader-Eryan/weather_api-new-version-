class WeatherModel {
  String cityName;
  String date;
  double temp;
  //double maxTemp;
  //double avgTemp;
  String imgUrl;
  String condition;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    //required this.maxTemp,
    //required this.avgTemp,
    required this.imgUrl,
    required this.condition,
  });
  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        cityName: data['location']['name'],
        date: data['current']['last_updated'],
        temp: data['current']['temp_c'],
        //maxTemp: data['day']['maxtemp_c'],
        //avgTemp: data['day']['avgtemp_c'],
        imgUrl: data['current']['condition']['icon'],
        condition: data['current']['condition']['text']);
  }
  @override
  String toString() {
    return 'temp= $temp, date= $date';
  }
}
