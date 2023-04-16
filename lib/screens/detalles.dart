import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_aplicacion/models/actores_api.dart';
import 'package:mi_aplicacion/models/respuesta_api.dart';
import 'package:mi_aplicacion/services/servicios_peliculas.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetallesScreen extends StatelessWidget {
  const DetallesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PeliculasAPI pelis =
        ModalRoute.of(context)!.settings.arguments as PeliculasAPI;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de peliculas"),
        centerTitle: true,
        backgroundColor: (Colors.red[400]),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
                [Cards(pelis), 
                Descripcion(pelis), 
                Actor(pelis.id),
                ]
          )
      )],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final PeliculasAPI pelis;

  const Cards(this.pelis);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"),
                image: NetworkImage(pelis.obtenerImagenes),
                height: 150),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Text(
                pelis.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//CARTA QUE MUESTRA ACTORES
class Actor extends StatelessWidget {
  final int idPelicula;

  const Actor(this.idPelicula);

  @override
  Widget build(BuildContext context) {
    final peliculasClase = Provider.of<Peliculas>(context, listen: false);

    return FutureBuilder(
        future: peliculasClase.devuelveActores(idPelicula),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
         
         if( !snapshot.hasData ) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }
        
          final List<Cast> actores = snapshot.data!;
  

          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 190,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => cartasActores( actores[index]),
            ),
          );
        });
  }
}

//DESCRIPCION DE LA PELICULA
class Descripcion extends StatelessWidget {
  final PeliculasAPI pelis;

  const Descripcion(this.pelis);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(pelis.overview,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            )));
  }
}

//CARTA ACTORES
class cartasActores extends StatelessWidget {

  final Cast actor;

  const cartasActores(this.actor);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:  FadeInImage(
              placeholder: const NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"),
              image: NetworkImage( actor.obtenerActores ),
              height: 150),
        ),
        const SizedBox(height: 5),
         Text(
          actor.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

