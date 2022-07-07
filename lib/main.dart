
import 'package:bib_digitalapp/alumno/buscador.dart';
import 'package:bib_digitalapp/alumno/datos_libros.dart';
import 'package:bib_digitalapp/alumno/historial.dart';
import 'package:bib_digitalapp/libro_subido.dart';
import 'package:bib_digitalapp/login.dart';
import 'package:bib_digitalapp/alumno/perfil.dart';
import 'package:bib_digitalapp/bibliotecario/qr_lector.dart';
import 'package:bib_digitalapp/alumno/qr_reserva.dart';
import 'package:bib_digitalapp/bibliotecario/detalle_reserva.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      
      initialRoute: 'login',
      routes: {
         'login': (context) => const VistaLogin(),
         
        'buscador': (context) => const VistaBuscador(),
        'historial': ((context) => const VistaHistorial()),
        'datos': (context) => const VistaDatosLibros(),
        'reserva': (context) => const VistaReservaQR(),
        'perfil': (context) => const VistaPerfil(),
        'libroSubido': (context) => const LibroGuardado(),

        'lector': (context) => const VistaLectorQR(),
        'detalleReserva': (context) => const VistaDetalleReserva(),
      },
    );
  }
}
