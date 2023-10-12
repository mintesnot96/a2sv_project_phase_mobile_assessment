import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/repositories/weather_repository.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/services/weather_service.dart';
import 'package:a2sv_project_phase_mobile_assessment/presentation/weather/blocs/weather_bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future setupInjector() async {
//Common
  sl.registerSingleton<Dio>(Dio());

  //Services
  sl.registerLazySingleton<WeatherService>(() => WeatherService(dio: sl()));
  //Repositories

  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherService: sl()));

  //Blocs

  sl.registerLazySingleton<WeatherBloc>(
      () => WeatherBloc(weatherRepository: sl()));
}
