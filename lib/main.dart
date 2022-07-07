import 'package:bib_digitalapp/buscador.dart';
import 'package:bib_digitalapp/datos_libros.dart';
import 'package:bib_digitalapp/historial.dart';
import 'package:bib_digitalapp/libro_subido.dart';
import 'package:bib_digitalapp/login.dart';
import 'package:bib_digitalapp/navegador.dart';
import 'package:bib_digitalapp/perfil.dart';
import 'package:bib_digitalapp/qr_lector.dart';
import 'package:bib_digitalapp/qr_reserva.dart';
import 'package:bib_digitalapp/web/buscador.dart';
import 'package:bib_digitalapp/web/carga_errores.dart';
import 'package:bib_digitalapp/web/detalle_reserva.dart';
import 'package:bib_digitalapp/web/editar.dart';
import 'package:bib_digitalapp/web/historialWeb.dart';
import 'package:bib_digitalapp/web/login.dart';
import 'package:bib_digitalapp/web/subida_manual.dart';
import 'package:bib_digitalapp/web/carga_libros.dart';

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
      initialRoute: 'loginWeb',
      routes: {
        'navegador': ((context) => const VistaNavegador()),
        'loginWeb': (context) => const VistaLoginWeb(),
        'datos': (context) => const VistaDatosLibros(),
        'reserva': (context) => const VistaReservaQR(),
        'perfil': (context) => const VistaPerfil(),
        'buscadorWeb': ((context) => const BuscadorWeb()),
        'subidaManual': ((context) => const subidaManual()),
        'editar': ((context) => const editar()),
        'historialWeb': ((context) => const historialWeb()),
        'carga': (context) => const CargaLibros(),
        'libroSubido': (context) => const LibroGuardado(),
        'detalleReserva': (context) => const VistaDetalleReserva(),
        'cargaErrores': (context) => const CargaErrores(),
      },
    );
  }
}
