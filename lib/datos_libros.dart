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
                          width: 150,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            args.titulo,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Text("Autor: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(child: Text(args.autor)),
                          ]),
                          Row(
                            children: [
                              const Text("Editorial: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(child: Text(args.editorial))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Año: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(args.ano.toString()),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Resumen: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(child: Text(args.resumen))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "otroTitulo: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(args.otroTitulo),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "cdd: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(args.cdd)
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "isbn: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(args.isbn)
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "tipoMaterial: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(args.tipoMaterial)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'reserva'),
                          child: const Text("RESERVA"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
