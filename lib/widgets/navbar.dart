import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mi_aplicacion/models/respuesta_api.dart';

class NavBarScreen extends StatelessWidget {
  final List<PeliculasAPI> peliculas;
  const NavBarScreen({Key? key, required this.peliculas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanio = MediaQuery.of(context).size;

    if (this.peliculas.length == 0) {
      return Container(
        width: double.infinity,
        height: tamanio.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: tamanio.height * 0.9,
      color: const Color.fromARGB(175, 220, 231, 231),
      child: Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        itemWidth: tamanio.width * 0.6,
        itemHeight: tamanio.height * 0.9,
        itemBuilder: ((_, index) {
          final peliculasImg = peliculas[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detalles', arguments: peliculasImg ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"),
                image: NetworkImage(peliculasImg.obtenerImagenes),
              ),
            ),
          );
        }),
      ),
    );
  }
}
