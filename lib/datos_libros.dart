import 'dart:convert';

import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modelo/libro.dart';

class VistaDatosLibros extends StatefulWidget {
  const VistaDatosLibros({Key? key}) : super(key: key);

  @override
  State<VistaDatosLibros> createState() => _VistaDatosLibrosState();
}

class _VistaDatosLibrosState extends State<VistaDatosLibros> {
  List<CopiaLibro> copias = [];

  @override
  void initState() {
    super.initState();
  }

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
                          onPressed: () async => {
                            copias = await buscarCopias(),
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: const Text("Ejemplares: "),
                                      content: SizedBox(
                                        width: 300,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: copias.length,
                                            itemBuilder: (context, i) {
                                              return GestureDetector(
                                                onTap: (() => Navigator
                                                    .pushReplacementNamed(
                                                        context, 'reserva', arguments: args)),
                                                child: ListTile(
                                                    title: Text("copia " +
                                                        copias[i]
                                                            .idEspecifico
                                                            .toString()),
                                                    trailing: Text("Estado: " +
                                                        copias[i].estado),
                                                    tileColor: Colors.grey[300],
                                                    hoverColor: Colors.grey,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                    )),
                                              );
                                            }),
                                      ),
                                    ),
                                barrierDismissible: true)
                          },
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

  Future<List<CopiaLibro>> buscarCopias() async {
    final response = await http
        .get(Uri.http("200.13.5.14:7102", "/copialibro/", {'q': '{http}'}));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<CopiaLibro> copias =
          List<CopiaLibro>.from(l.map((model) => CopiaLibro.fromJson(model)));
      for (CopiaLibro copia in copias) {
        copia.estado = 'disponible';
      }

      return copias;
    } else {
      return [];
    }
  }
}
