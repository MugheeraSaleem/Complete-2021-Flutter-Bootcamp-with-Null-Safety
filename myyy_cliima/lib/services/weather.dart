import 'package:myyy_cliima/services/location.dart';
import 'package:myyy_cliima/services//networking.dart';
import 'package:myyy_cliima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    var url = '$openweathermapURL?q=$cityname&appid=$kAPIkey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weather_data = await networkHelper.getData();
    return weather_data;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '$openweathermapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIkey&units=metric',
    );
    var weather_data = await networkHelper.getData();
    return weather_data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time in';
    } else if (temp > 20) {
      return 'Time for shorts and ๐ in';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค in';
    } else {
      return 'Bring a ๐งฅ just in case in';
    }
  }
}
