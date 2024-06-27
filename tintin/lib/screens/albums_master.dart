import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/widgets/album_preview.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {

  List<Album> _readingList = [];

  bool _isInReadinglist(Album album) {
    return _readingList.contains(album);
  }

  void _toggleReadingList(Album album) {
    setState(() {
      if (_isInReadinglist(album)) {
        _readingList.remove(album);
      } else {
        _readingList.add(album);
      }
    });
  }

  Widget showAlbums(){
    return FutureBuilder<List<Album>>(
      future: AlbumService.fetchAlbums(), 
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final albums = snapshot.data!;
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              return AlbumPreview(
                album: album,
                isInReadingList: _isInReadinglist(album),
                toggleReadingList: _toggleReadingList,
                );
            }
          );
        }else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }else{
          return const Text("Pas de données trouvées");
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.title),
      ),
      body: Center(
        child: 
            showAlbums()
      ),
    );
  }
}
