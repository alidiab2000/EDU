// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  String cityName;
  WeatherSuccess({
    required this.weatherModel,
    required this.cityName,
  });
  
  
}

class WeatherFailure extends WeatherState {}
