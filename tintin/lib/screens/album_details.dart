import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  
  const AlbumDetails({
    super.key, 
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadingListProvider>( 
      builder: (context,readingListProvider, child){
        return 
      
      Scaffold(
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
          readingListProvider.toggle(album);
        },
        child: Icon(
          (readingListProvider.isInReadingList(album)) ? Icons.remove : Icons.add,
        ),
      ), 
    );
      });
      
  }
}