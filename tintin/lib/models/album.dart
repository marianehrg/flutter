import 'dart:convert';

class Album {
 
  final String _title;
  final int _number;
  final int _year;
  final int? _yearInColor;
  final String _image;
  final String _resume;

  Album(
    this._title,
    this._number,
    this._year,
    this._yearInColor,
    this._image,
    this._resume
  );

  String get title => _title;
  int get number => _number;
  int get year => _year;
  int? get yearInColor => _yearInColor;
  String get image => _image;
  String get resume => _resume;

  @override
  String toString() {
    return 'Album{title: $_title, number: $_number, year: $_year, yearInColor: $_yearInColor, image: $_image, resume: $_resume}';
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      json['titre'],
      json['numero'],
      json['parution'],
      json['parutionEnCouleur'],
      json['image'],
      json['resume']
    );
  }

  String toJson(){
    final Map<String, dynamic> data = {
      'title': _title,
      'number': _number,
      'year': _year,
      'yearInColor': _yearInColor,
      'image': _image,
      'resume': _resume,
    };
    return json.encode(data);
  }

}
