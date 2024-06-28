import 'package:flutter/material.dart';
import 'package:meteo/service/api_service.dart';

class Weather extends StatefulWidget {
  Weather({super.key});

  
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  final ApiService _apiService = ApiService();
  String _city ="";
  
  Widget _showErrorPopUp() {
    return FutureBuilder<dynamic>(
      future: showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        "Aucune ville n'a été entrée.")
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        throw UnimplementedError;
      },
    );
  }

  void _setCity(String value){
    setState(() {
      if(value.isEmpty){
        _showErrorPopUp();
      }else{
      _city = value;
      }
    });
  }

  void _performSearch(){
    final cityData = _apiService.getCityCoordinates(_city);
    
    // return FutureBuilder(
    //   future: ,
    //   builder: 
    // );
  }

  Widget _showResult(String data){
    return const Center(
      child: Column(
        children: [
          Text("Ville: "),
          Text("Pays: "),
          Text("Température: ")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Météo",
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 161, 214, 238),
        body: Column(children: [
          Row(
          children: [
            Expanded(
              child:
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Entrez une ville"
                  ),
                  onChanged: (value) {
                    _setCity(value);
                  },
                ),    
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                _performSearch();
              },
              child: const Icon(
                Icons.search
              ),
            ),  
          ]
        ),
        _showResult(""),
        ],
      ) 
      )
    );
  }
}