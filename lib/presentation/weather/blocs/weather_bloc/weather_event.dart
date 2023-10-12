part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String query;
  FetchWeather({required this.query});
}
