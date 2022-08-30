import 'package:flutter/material.dart';

class weatherModel {
  DateTime date;
  double maxtemp;
  double mintemp;
  double temp;
  String stateOfWeather;
  String name;
  weatherModel({
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
    required this.stateOfWeather,
    required this.name,
  });
  factory weatherModel.jsonData(Map<String, dynamic> data) {
    var json = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date:DateTime.parse( data['location']['localtime']),
        name: data['location']['name'],
        maxtemp: json['maxtemp_c'],
        mintemp: json['mintemp_c'],
        temp: json['avgtemp_c'],
        stateOfWeather: json['condition']['text']);
  }
  String getImage() {
    if (stateOfWeather == 'Clear' || stateOfWeather == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (stateOfWeather == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (stateOfWeather == 'Light rain' ||
        stateOfWeather == 'Heavy rain' || stateOfWeather == 'Moderate rain' ||
        stateOfWeather == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (stateOfWeather == 'Snow' ||
        stateOfWeather == 'Sleet' ||
        stateOfWeather == 'Hail') {
      return 'assets/images/snow.png';
    } else if (stateOfWeather == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (stateOfWeather == 'Clear' || stateOfWeather == 'Light Cloud'|| stateOfWeather =='Sunny') {
      return Colors.orange;
    } else if (stateOfWeather == 'Heavy Cloud') {
      return Colors.blue;
    } else if (stateOfWeather == 'Light Rain' ||
        stateOfWeather == 'Heavy Rain' ||
        stateOfWeather == 'Showers') {
      return Colors.amber;
    } else if (stateOfWeather == 'Snow' ||
        stateOfWeather == 'Sleet' ||
        stateOfWeather == 'Hail'  ) {
      return Colors.blueGrey;
    } else if (stateOfWeather == 'Thunderstorm') {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }
}
