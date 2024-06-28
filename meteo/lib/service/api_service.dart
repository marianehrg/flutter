import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meteo/dto/weather_dto.dart';
import 'package:meteo/models/city.dart';
import 'package:meteo/models/weather.dart';
import 'package:meteo/weather_master.dart';

class ApiService {
  final Dio _dioCity = Dio();
  final Dio _dioWeather = Dio();

  ApiService() {
    _dioCity.options.baseUrl = dotenv.env['CITY_API_BASE_URL']!;
    _dioWeather.options.baseUrl = dotenv.env['WEATHER_API_BASE_URL']!;
  }

  Future<Response> getCityCoordinates(String cityName) async {
    try {
      final response = await _dioCity.get('/city', queryParameters: {
        'name': cityName },
        options: Options(
          headers: {
            'X-Api-Key': dotenv.env['CITY_API_KEY']
          }
        )
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load coordinates');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Response> getLocationWeather(double lat, double long) async {
    try {
      final response = await _dioWeather.get('/weather', queryParameters: {
        'lat': lat,
        'long': long,
        'appid': dotenv.env['WEATHER_API_KEY']
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  City getCity(dynamic response){
    return City.fromJson(response); 
  }

  // Weather getWeather(dynamic response){

  // }

  // WeatherDto getWeatherDto(){
  //   // City city = getCity(getCityCoordinates());
  //   // Weather weather = getLocationWeather(city.latitude, city.longitude);
  //   return WeatherDto(city.name, city.country, _celsius);
  // }
}
