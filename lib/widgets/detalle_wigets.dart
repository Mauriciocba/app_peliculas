/*import 'package:card_swiper/card_swiper.dart';*/
import 'package:flutter/material.dart';
/*import 'package:mi_aplicacion/models/respuesta_api.dart';*/

class DetallesPeliculasScreen extends StatelessWidget {
  const DetallesPeliculasScreen({super.key});

  //final List<PeliculasAPI> peliculas;
  /*const DetallesPeliculasScreen({Key? key, required this.peliculas}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
                Cards()
                
            ]),
          )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: NetworkImage("https://static.wikia.nocookie.net/wikianimeotaku/images/b/b1/025Pikachu_XY_anime_3.png/revision/latest?cb=20160211185004&path-prefix=es"),
               image: NetworkImage("https://static.wikia.nocookie.net/wikianimeotaku/images/b/b1/025Pikachu_XY_anime_3.png/revision/latest?cb=20160211185004&path-prefix=es")
               ),
          )
        ],
      ),
    );
  }
}
