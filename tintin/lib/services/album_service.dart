import 'package:tintin/models/album.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'dart:convert';

class AlbumService {

  static Future<List<Album>> generateAlbums(int count) async {

    List<String> images = ["coke-en-stock.jpg","l-affaire-tournesol.jpg","le-crabe-aux-pinces-d-or.jpg","le-lotus-bleu.jpg","les-7-boules-de-cristal.jpg",
    "les-bijoux-de-la-castafiore.jpg","le-sceptre-d-ottokar.jpg","les-cigares-du-pharaon.jpg","le-secret-de-la-licorne.jpg","le-temple-du-soleil.jpg"];
    List<String> titles = ["Coke en stock","L'affaire tournesol","Le crabe aux pinces d'or","Le lotus bleu","Les 7 boules de cristal","Les bijoux de la castafiore",
    "Le spectre d'ottokar","les cigares du pharaon","Le secret de la licorne","Le temple du soleil"];

    final List<Album> albums = List.generate(count, (index) {
      return Album(
        titles[index],
        index + 1,
        2000 + Random().nextInt(24),
        2000 + Random().nextInt(24),
        images[index],
        'This is the resume for album ${index + 1}',
      );
    });

    return albums;
  }

  static Future<List<Album>> fetchAlbums() async {
    final String response = await rootBundle.loadString('data/albums.json');
    final List<dynamic> data = json.decode(response); // Utilisation de json.decode au lieu de jsonDecode

    List<Album> albums = data.map((json) => Album.fromJson(json)).toList();
    return albums;
  }
  
}