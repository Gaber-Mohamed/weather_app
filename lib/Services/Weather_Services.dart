import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weatherModel.dart';

class weatherservices {
  Future<weatherModel?> getweather({required String cityName}) async {
    weatherModel? model1;
    try {
      String key = '%206f60cda7e8ba4c9dbc495915221308%20';
      String Url =
          'https://api.weatherapi.com/v1/forecast.json?key=$key&q=$cityName&days=4';
      Uri url = Uri.parse(Url);
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body);
       model1 = weatherModel.jsonData(data);
      return model1;
    } catch (ex) {
      print(ex);
    }
    return model1;
  }
}
