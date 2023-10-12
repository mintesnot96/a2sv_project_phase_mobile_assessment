import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/error_response.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/weather_response.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<Either<ErrorResponse, WeatherReponse>> fetchWeather(
      String query) async {
    try {
      String url =
          'https://api.worldweatheronline.com/premium/v1/weather.ashx?key=68da0c21ae6d455e91771733231110&q=$query&num_of_days=7&tp=3&format=json';

      final response = await dio.get(url);
      print('the response is successful');
      return Right(WeatherReponse.fromJson(response.data));
    } catch (e) {
      print('the error is $e');
      return Left(ErrorResponse(message: 'Something went wrong'));
    }
  }
}
