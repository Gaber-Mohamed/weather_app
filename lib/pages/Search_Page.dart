import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Services/Weather_Services.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/Provider_model.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              weatherservices Service = weatherservices();
              weatherModel? MOD1 = await Service.getweather(cityName: cityName!);
              Provider.of<weatherProvider>(context, listen: false).weatherData = MOD1;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () async {
                    weatherservices Service = weatherservices();
                    weatherModel? MOD1 =
                        await Service.getweather(cityName: cityName!);
                    Provider.of<weatherProvider>(context, listen: false)
                        .weatherData = MOD1;
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
              label: Text('Search'),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            ),
          ),
        ),
      ),
    );
  }
}
