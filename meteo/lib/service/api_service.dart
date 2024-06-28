import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dioCity = Dio();
  final Dio _dioWeather = Dio();

  ApiService() {
    _dioCity.options.baseUrl = dotenv.env['CITY_API_BASE_URL']!;
    _dioWeather.options.baseUrl = dotenv.env['WEATHER_API_BASE_URL']!;
  }

  Future<Map<String, dynamic>> getCityCoordinates(String cityName) async {
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

  Future<Map<String, dynamic>> getLocationWeather(String lat, String long) async {
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
}
