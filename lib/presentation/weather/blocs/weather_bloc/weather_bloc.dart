import 'package:bloc/bloc.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/weather_response.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherFacade weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeather) {
        emit(WeatherLoading());
        // await Future.delayed(Duration(seconds: 4))
        //     .then((value) => emit(WeatherError(errorMessage: 'error')));
        final response = await weatherRepository.fetchWeather(event.query);

        response.fold(
            (error) => emit(WeatherError(errorMessage: error.message!)),
            (result) => emit(WeatherSuccess(weatherReponse: result)));
      }
    });
  }
}
