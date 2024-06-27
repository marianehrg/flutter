import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) toggleReadingList;

  const AlbumPreview({
    super.key, 
    required this.album,
    required this.isInReadingList,
    required this.toggleReadingList
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      tileColor: (isInReadingList) ? Colors.purple : Colors.white,
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
                isInReadingList: isInReadingList,
                toggleReadingList: toggleReadingList),
            ),
          );
          Text('$result');
        },
    );
  }
}