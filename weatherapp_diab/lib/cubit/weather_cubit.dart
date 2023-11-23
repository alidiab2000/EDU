// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp_diab/Services/weather_service.dart';
import 'package:weatherapp_diab/models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;

  String? cityName;
  WeatherModel? weatherModel;
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
        weatherModel =
          await weatherService.getweather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!, cityName: cityName));
    } on Exception catch (e) {
      print(e);
      emit(WeatherFailure());
    }
  }
}
