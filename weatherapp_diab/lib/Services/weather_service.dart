import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

dynamic baseurl = 'http://api.weatherapi.com/v1';
dynamic apiKey = "1fe4c54325184009af2192535230605";

class WeatherService {
  Future<WeatherModel> getweather({required String cityName}) async {
    dynamic url =
        Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$cityName&days=5');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather  = WeatherModel.fromJson(data: data);
    return weather;
  }
}
