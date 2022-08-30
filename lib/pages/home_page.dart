import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/pages/Search_Page.dart';
import 'package:weather_app/Services/Weather_Services.dart';
import 'package:weather_app/providers/Provider_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Provider.of<weatherProvider>(context,listen: true).weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Provider.of<weatherProvider>(context)
                        .weatherData!
                        .getColor(),
                    Provider.of<weatherProvider>(context)
                        .weatherData!
                        .getColor()[300]!,
                    Provider.of<weatherProvider>(context)
                        .weatherData!
                        .getColor()[200]!,
                    Provider.of<weatherProvider>(context)
                        .weatherData!
                        .getColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        '${Provider.of<weatherProvider>(context).weatherData?.name}',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Updated at : ${Provider.of<weatherProvider>(context).weatherData?.date.hour.toString()}:${Provider.of<weatherProvider>(context).weatherData?.date.minute.toString()}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                              '${Provider.of<weatherProvider>(context).weatherData?.getImage()}'),
                          Text(
                              '${Provider.of<weatherProvider>(context).weatherData?.temp}',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500)),
                          Column(
                            children: [
                              Text(
                                  'Max: ${Provider.of<weatherProvider>(context).weatherData?.maxtemp}'),
                              Text(
                                  'Min:${Provider.of<weatherProvider>(context).weatherData?.mintemp}'),
                            ],
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                          '    ${Provider.of<weatherProvider>(context).weatherData?.stateOfWeather}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 5,
                      ),
                    ]),
              ),
            ),
    );
  }
}
