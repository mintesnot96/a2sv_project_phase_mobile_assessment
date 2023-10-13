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
  const MyApp({Key? key});

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
        initialRoute: '/',
        routes: {
          '/': (context) => OnboardingPage(),
          '/home': (context) => WeatherPage(),
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF2E2294), // Background color (2E2294FF)
        child: Center(
          child: Column(
            children: [

              Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Image.asset('assets/wim.png', width: 250, height: 250),
                ],
              ),

               const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Padding(

                     padding: EdgeInsets.only(top: 30,bottom: 5),
                     child: Text(
                       'Weather',
                       style: TextStyle(
                         color: Colors.amber,
                         fontWeight: FontWeight.bold,
                         fontSize: 24,
                       ),
                       textAlign: TextAlign.left, // Align text to the left
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 5,bottom: 5),
                     child: Text(
                       'Forecast App',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                       ),
                       textAlign: TextAlign.left, // Align text to the left
                     ),
                   ),
                   Text(
                     "It's the app that has a bunch of features, and that includes most of what every weather app has.",
                     style: TextStyle(color: Colors.white),
                     textAlign: TextAlign.left, // Align text to the left
                   ),
                 ],
               ),
              Spacer(),
              ElevatedButton(

                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Get Started',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Change the button background color to yellow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
