import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';




class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    WeatherModel weatherModel=WeatherModel();

    var weatherData = await weatherModel.getWeatherLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather:weatherData);
    }));


  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
