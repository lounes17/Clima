import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  final  locationWeather;
  LocationScreen({@required this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
  int temperateur;
  int temp;
  String city;
  int condition;
  String weatherIcon;
  String getmessage;
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);

  }
  Future <void> updateUI(dynamic weatherData){
    setState(() {
      if (weatherData == null) {
        temperateur = 0;
        weatherIcon = 'Error';
        getmessage = 'Unable to get weather data';
        city = '';
        return;
      }
      temp=weatherData['main']['temp'];
       temperateur=temp.toInt();
      condition=weatherData['weather'][0]['id'];
      weatherIcon=weather.getWeatherIcon(condition);
      getmessage=weather.getMessage(temperateur);
      city=weatherData['name'];

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
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                     var typedName=await  Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return CityScreen();
                      }
                      ));
                     print(typedName);
                     if (typedName!=null) {
                       var  weatherDat= await weather.getCityWeather(typedName);
                       print(weatherDat);
                       updateUI(weatherDat);

                     }
                    },

                    child: Icon(
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
                      '$temperateur °',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$getmessage in $city",
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
