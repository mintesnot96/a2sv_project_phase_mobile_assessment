import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:a2sv_project_phase_mobile_assessment/data/models/weather_response.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({super.key, required this.weatherResponse});
  final WeatherReponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(33, 23, 114, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(weatherResponse.data.request.first.query),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Temperature: ${weatherResponse.data.currentCondition.first.tempC}',
            style: TextStyle(color: Color.fromRGBO(33, 23, 114, 1)),
          ),
          Text(
            'City: ${weatherResponse.data.request.first.query}',
            style: TextStyle(color: Color.fromRGBO(33, 23, 114, 1)),
          ),
          Container(
            height: 100,
            width: 100,
            child: Image.network(weatherResponse
                .data.currentCondition.first.weatherIconUrl.first.value),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(52, 39, 152, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Every day',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: weatherResponse.data.weather.length,
                      itemBuilder: (context, index) {
                        return _weatherDayItem(
                            weatherResponse.data.weather[index]);
                      }),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _weatherDayItem(Weather weather) {
    String formattedString = DateFormat('E, MMM d').format(weather.date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(formattedString, style: TextStyle(color: Colors.white)),
          Row(
            children: [
              Text(
                weather.mintempC,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(weather.maxtempC, style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
