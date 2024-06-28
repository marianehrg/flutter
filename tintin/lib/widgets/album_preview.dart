import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({
    super.key, 
    required this.album
  });

  @override
  Widget build(BuildContext context) {
    return 
    Consumer<ReadingListProvider>(builder: (context,readingListProvider,child){

  return  ListTile(
      title: Text(album.title),
      tileColor: (readingListProvider.isInReadingList(album)) ? Colors.purple : Colors.white,
      leading: 
        (album.image.isNotEmpty) ?
        Image.asset('images/${album.image}') :
        const Icon(Icons.no_photography_outlined),
        onTap: () {
          final result = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetails(
                album: album,
            ),
          ));
          Text('$result');
        },
    );
    });

  }
}