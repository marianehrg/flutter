class WeatherDto {
  final String _city;
  final String _country;
  final String _celsius;

  WeatherDto(this._city, this._country, this._celsius);

  String get city => _city;
  String get country => _country;
  String get celsieus => _celsius;
  
}