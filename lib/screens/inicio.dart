import 'package:flutter/material.dart';
import 'package:mi_aplicacion/services/servicios_peliculas.dart';
import 'package:mi_aplicacion/widgets/widgets.dart';
import 'package:provider/provider.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peliculasProvider = Provider.of<Peliculas>(context);

    print(peliculasProvider.traePeliculas);

    return Scaffold(
        appBar: AppBar(title: const Text("Peliculas"), centerTitle: true,
        backgroundColor: (Colors.lightBlue[900]), actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ]),
        body: Column(
          children: [NavBarScreen(peliculas: peliculasProvider.traePeliculas)],
        ));
  }
}
