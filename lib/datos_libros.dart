import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

import 'modelo/libro.dart';

class VistaDatosLibros extends StatefulWidget {
  const VistaDatosLibros({Key? key}) : super(key: key);

  @override
  State<VistaDatosLibros> createState() => _VistaDatosLibrosState();
}

class _VistaDatosLibrosState extends State<VistaDatosLibros> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Libro;
    return Scaffold(
        appBar: BaseAppBar(
          title: const Text("Datos Libro"),
          appBar: AppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://picsum.photos/250?image=9',
                            width: 200,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            args.titulo,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Autor: " + args.autor),
                            Text(
                              "Editorial: " + args.editorial,
                            ),
                            Text(
                              "Año: " + args.ano.toString(),
                            ),
                            Text("Resumen: " + args.resumen),
                            Text("otroTitulo: " + args.otroTitulo),
                            Text("cdd: " + args.cdd),
                            Text("isbn: " + args.isbn),
                            Text("tipoMaterial: " + args.tipoMaterial),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () =>
                            Navigator.pushNamed(context, 'reserva'),
                        child: const Text("RESERVA"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
