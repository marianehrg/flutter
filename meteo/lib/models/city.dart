
class City {

  final String _name;
  final double _latitude;
  final double _longitude;
  final String _country;
  final int _population;
  final bool _isCapital;

  City(
    this._name,
    this._latitude,
    this._longitude,
    this._country,
    this._population,
    this._isCapital
  );

  String get name => _name;
  double get latitude => _latitude;
  double get longitude => _longitude;
  String get country => _country;
  int get population => _population;
  bool get isCapital => _isCapital;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      json['titre'],
      json['numero'],
      json['parution'],
      json['parutionEnCouleur'],
      json['image'],
      json['resume']
    );
  }
}