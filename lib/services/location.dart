import 'package:geolocator/geolocator.dart';
import 'dart:async';

class Location {
  double latitude;
  double longitude;
  Future <void> getCurrentLocation () async{


    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    this.latitude=position.latitude;
    this.longitude=position.longitude;


  }

}