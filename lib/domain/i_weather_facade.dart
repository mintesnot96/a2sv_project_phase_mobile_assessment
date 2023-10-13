import 'package:dartz/dartz.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/error_response.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/weather_response.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/services/weather_service.dart';

abstract class WeatherFacade {
  Future<Either<ErrorResponse, WeatherReponse>> fetchWeather(String query);
}
