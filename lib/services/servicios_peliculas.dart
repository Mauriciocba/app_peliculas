import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mi_aplicacion/models/actores_api.dart';
import 'package:mi_aplicacion/models/respuesta_api.dart';

class Peliculas extends ChangeNotifier {
  final String _apiKey = '7c064fe35c52f94fd7462798a3d7d4e2';
  final String _baseURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<PeliculasAPI> traePeliculas = [];

  Map<int, List<Cast>> actoresPeliculas = {};

  Peliculas() {
    print("hola");

    mostrarPeliculas();
  }

  Future<String> muestraDatosAPi(String endpoin, [int page = 1]) async {
    var url = Uri.https(_baseURL, endpoin,
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final respuesta = await http.get(url);
    return respuesta.body;
  }

  mostrarPeliculas() async {
    var url = Uri.https(_baseURL, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final respuesta = RespuestaApi.fromJson(response.body);

    traePeliculas = respuesta.results;
    print(traePeliculas);
    notifyListeners();
  }

Future<List<Cast>> devuelveActores(int idPelicula) async{

  final jsonData = await muestraDatosAPi('3/movie/$idPelicula/credits');
  final respuestaActores = ActoresApi.fromJson(jsonData);

  actoresPeliculas[idPelicula] = respuestaActores.cast;


  return respuestaActores.cast;
}

}
