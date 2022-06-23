import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:flutter/material.dart';

class LibroGuardado extends StatefulWidget {
  const LibroGuardado({Key? key}) : super(key: key);

  @override
  State<LibroGuardado> createState() => _LibroGuardadoState();
}

class _LibroGuardadoState extends State<LibroGuardado> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Libro;

    return Container();
  }
}
