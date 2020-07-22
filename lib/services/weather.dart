import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const  apiKey='b72c0f5b0b28094d5bc2871bccdb7b1c';

class WeatherModel {
  Future <dynamic> getCityWeather(String CityName) async{
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$CityName&appid=$apiKey&units=metric');
    return await networkHelper.getData();

  }
  double longitudeapi;
  double latitudeapi;
  Future <dynamic> getWeatherLocation()async{
    Location location=Location();
    await location.getCurrentLocation();
    latitudeapi=location.latitude;
    longitudeapi= location.longitude;
    print('lat ${latitudeapi.toStringAsFixed(1)}');
    print('lan ${longitudeapi.toStringAsFixed(1)}');
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${latitudeapi.toStringAsFixed(1)}&lon=${longitudeapi.toStringAsFixed(1)}&appid=$apiKey&units=metric');
    return await networkHelper.getData();

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
