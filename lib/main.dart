import 'package:flutter/material.dart';
import 'package:mi_aplicacion/screens/screens.dart';
import 'package:mi_aplicacion/services/servicios_peliculas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Api());
}

class Api extends StatelessWidget {
  const Api({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> Peliculas(), lazy: false, ),
    ], 
    child: const MyApp() ,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio',
      routes: {
        'inicio': (_) => const InicioScreen(),
        'detalles': (context) => const DetallesScreen()//
      },
    );
  }
}
