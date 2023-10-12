// To parse this JSON data, do
//
//     final weatherReponse = weatherReponseFromJson(jsonString);

import 'dart:convert';

WeatherReponse weatherReponseFromJson(String str) => WeatherReponse.fromJson(json.decode(str));

String weatherReponseToJson(WeatherReponse data) => json.encode(data.toJson());

class WeatherReponse {
    Data data;

    WeatherReponse({
        required this.data,
    });

    factory WeatherReponse.fromJson(Map<String, dynamic> json) => WeatherReponse(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    List<Request> request;
    List<CurrentCondition> currentCondition;
    List<Weather> weather;

    Data({
        required this.request,
        required this.currentCondition,
        required this.weather,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        request: List<Request>.from(json["request"].map((x) => Request.fromJson(x))),
        currentCondition: List<CurrentCondition>.from(json["current_condition"].map((x) => CurrentCondition.fromJson(x))),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "request": List<dynamic>.from(request.map((x) => x.toJson())),
        "current_condition": List<dynamic>.from(currentCondition.map((x) => x.toJson())),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    };
}

class CurrentCondition {
    String tempC;
    List<WeatherIconUrl> weatherIconUrl;

    CurrentCondition({
        required this.tempC,
        required this.weatherIconUrl,
    });

    factory CurrentCondition.fromJson(Map<String, dynamic> json) => CurrentCondition(
        tempC: json["temp_C"],
        weatherIconUrl: List<WeatherIconUrl>.from(json["weatherIconUrl"].map((x) => WeatherIconUrl.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "temp_C": tempC,
        "weatherIconUrl": List<dynamic>.from(weatherIconUrl.map((x) => x.toJson())),
    };
}

class WeatherIconUrl {
    String value;

    WeatherIconUrl({
        required this.value,
    });

    factory WeatherIconUrl.fromJson(Map<String, dynamic> json) => WeatherIconUrl(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}

class Request {
    String query;

    Request({
        required this.query,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        query: json["query"],
    );

    Map<String, dynamic> toJson() => {
        "query": query,
    };
}

class Weather {
    DateTime date;
    String mintempC;
    String maxtempC;

    Weather({
        required this.date,
        required this.mintempC,
        required this.maxtempC,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        date: DateTime.parse(json["date"]),
        mintempC: json["mintempC"],
        maxtempC: json["maxtempC"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "mintempC": mintempC,
        "maxtempC": maxtempC,
    };
}
