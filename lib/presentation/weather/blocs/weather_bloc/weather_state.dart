part of 'weather_bloc.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherReponse weatherReponse;
  WeatherSuccess({required this.weatherReponse});
}

final class WeatherError extends WeatherState {
  final String errorMessage;
  WeatherError({required this.errorMessage});
}




