import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/widgets/album_preview.dart';

class AlbumsMaster extends StatelessWidget {
  final String title;

  const AlbumsMaster({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(title),
      ),
      body: Center(child: Column(
      children: [
        Consumer<ReadingListProvider>(
            builder: (context, readingListProvider, child) {
          return FutureBuilder<List<Album>>(
              future: AlbumService.fetchAlbums(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final albums = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: albums.length,
                        itemBuilder: (context, index) {
                          final album = albums[index];
                          return AlbumPreview(
                            album: album,
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const Text("Pas de données trouvées");
                }
              });
        }),
        IconButton(onPressed: () {
          Provider.of<ReadingListProvider>(context, listen:false).clear();
        }, icon: const Icon(Icons.delete),),
      ],
    ),),
    );
  }
}
