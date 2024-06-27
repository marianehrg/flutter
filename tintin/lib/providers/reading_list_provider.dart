import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class ReadingListProvider extends ChangeNotifier{
  final List<Album> _readingList = [];
 
 UnmodifiableListView<Album> get readingList => UnmodifiableListView(_readingList);

  void addAlbum(Album item) {
    _readingList.add(item);
    notifyListeners();
  }

  void removeAlbum(int albumNumber) {
    _readingList.removeWhere((element) => element.number == albumNumber);
    notifyListeners();
  }
  
  Album getAlbumByNumero(int albumNumber){
    return _readingList.firstWhere(
    (album) => album.number == albumNumber);
  }

}
