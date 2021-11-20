import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:list_giphy/models/Gif.dart';
import 'package:http/http.dart' as http;
import 'models/Gif.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(
        "https://api.giphy.com/v1/gifs/trending?api_key=YQ3ay36mgYXeL0nD61j558iJnDDauKyl&limit=10&rating=g");

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData["data"]) {
        gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
      }

      return gifs;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API REST CON MI APP- DULCE '),
        ),
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: _listGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Error");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(
              child: Image.network(
            gif.url,
            fit: BoxFit.fill,
          )),
        ],
      )));
    }

    return gifs;
  }
}
