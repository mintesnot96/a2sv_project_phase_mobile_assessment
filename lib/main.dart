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
        debugShowCheckedModeBanner: false,
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
        color: Color.fromRGBO(52, 39, 152, 1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 170,
                    ),
                    // Add a circular shadow around the image
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(99, 91, 159, 1.0), // White color for the shadow
                            spreadRadius: 0, // Adjust the spread radius as needed
                            blurRadius: 1000, // Adjust the blur radius as needed
                          ),
                        ],
                      ),
                      child: Image.asset('assets/wim.png', width: 250, height: 250),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 5),
                      child: Text(
                        'Weather',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 186, 37, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Forecast App.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        // textAlign: TextAlign left,
                      ),
                    ),
                    Text(
                      "It's the app that has a bunch of features, and that includes most of what every weather app has.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                    // Your button code
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 186, 37, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text('Get Started', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}