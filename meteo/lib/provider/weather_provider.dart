
import 'package:flutter/material.dart';
import 'package:meteo/service/api_service.dart';

class WeatherProvider extends ChangeNotifier {

  final ApiService _apiService = ApiService();
  String _city = "";

  String get city => _city;

  void getWeather(String city){
    try{
      final cityResponse = _apiService.getCityCoordinates(city);
    } catch (e) {
    }
    notifyListeners();
  }
}