import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumDetails extends StatefulWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) toggleReadingList;
  
  AlbumDetails({
    super.key, 
    required this.album,
    required this.isInReadingList,
    required this.toggleReadingList
  });

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {

  bool _isInReadinglist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.album.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.album.image.isNotEmpty) ?
            Image.asset('images/${widget.album.image}',
                height: 200,) :
            const Icon(Icons.no_photography_outlined),
            Text(
              'Titre: ${widget.album.title}'
            ),
            Text('Numéro: ${widget.album.number}'),
            Text('Année: ${widget.album.year}'),
            if (widget.album.yearInColor != null) 
              Text('Année de parution en couleur: ${widget.album.yearInColor}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){
          widget.toggleReadingList(widget.album);
          setState(() {
            _isInReadinglist = !_isInReadinglist;
          });
        },
        child: Icon(
          (_isInReadinglist) ? Icons.remove : Icons.add,
        ),
      ), 
    );
  }
}