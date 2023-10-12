import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a2sv_project_phase_mobile_assessment/injector.dart';
import 'package:a2sv_project_phase_mobile_assessment/presentation/weather/blocs/weather_bloc/weather_bloc.dart';
import 'package:a2sv_project_phase_mobile_assessment/presentation/weather/weather_page.dart';

void main() async {
  await setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(create: (_) => sl<WeatherBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WeatherPage(),
      ),
    );
  }
}
