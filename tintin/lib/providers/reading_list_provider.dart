import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class ReadingListProvider extends ChangeNotifier{
  final List<Album> _readingList = [];

  List<Album> get readingList => List.unmodifiable(_readingList);

  bool  isInReadingList(Album album) =>
     _readingList.where((a)=>a.number==album.number).isNotEmpty;
  
  void addAlbum(Album item) {
    _readingList.add(item);
    notifyListeners();
  }

  void removeAlbum(int albumNumber) {
    _readingList.removeWhere((element) => element.number == albumNumber);
    notifyListeners();
  }

  void toggle(Album album) {
    isInReadingList(album) ? removeAlbum(album.number) : addAlbum(album);   
  }
  
  Album getAlbumByNumero(int albumNumber){
    return _readingList.firstWhere(
    (album) => album.number == albumNumber);
  }

  void clear(){
    _readingList.clear();
    notifyListeners();
  }


}
