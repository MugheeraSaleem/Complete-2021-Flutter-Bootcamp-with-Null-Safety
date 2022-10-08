import 'package:flutter/material.dart';
import 'package:myyy_cliima/screens/city_screen.dart';
import 'package:myyy_cliima/utilities/constants.dart';
import 'package:myyy_cliima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.location_weather});
  final location_weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temprature;
  late String message;
  late String weathericon;
  late String cityname;

  @override
  void initState() {
    super.initState();
    updateUI(widget.location_weather);
  }

  void updateUI(dynamic weather_data) {
    setState(() {
      if (weather_data == null) {
        temprature = 0;
        weathericon = 'Error';
        message = 'Unable to get weather data';
        cityname = '';
        return;
      }
      double temp = weather_data['main']['temp'];
      temprature = temp.toInt();
      message = weather.getMessage(temprature);

      var condition = weather_data['weather'][0]['id'];
      weathericon = weather.getWeatherIcon(condition);

      cityname = weather_data['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weather_data = await weather.getlocationweather();
                      updateUI(weather_data);
                    },
                    child: Icon(
                      color: Colors.white,
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() async {
                        var typedname = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        if (typedname != null) {
                          var data = await weather.getcityweather(typedname);
                          updateUI(data);
                        }
                      });
                    },
                    child: Icon(
                      color: Colors.white,
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathericon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message $cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
