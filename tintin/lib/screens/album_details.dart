import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) toggleReadingList;

  const AlbumDetails({
    required this.album,
    required this.isInReadingList,
    required this.toggleReadingList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(album.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (album.image.isNotEmpty) ?
            Image.asset('images/${album.image}',
                height: 200,) :
            const Icon(Icons.no_photography_outlined),
            Text(
              'Titre: ${album.title}'
            ),
            Text('Numéro: ${album.number}'),
            Text('Année: ${album.year}'),
            if (album.yearInColor != null) 
              Text('Année de parution en couleur: ${album.yearInColor}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){
          toggleReadingList(album);
        },
        child: Icon(
          (isInReadingList) ? Icons.remove : Icons.add,
        ),
      ), 
    );
  }
}