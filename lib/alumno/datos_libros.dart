import 'dart:convert';

import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:bib_digitalapp/modelo/globalData.dart';
import 'package:bib_digitalapp/modelo/postReserva.dart';
import 'package:bib_digitalapp/services/ReservaService.dart';
import 'package:bib_digitalapp/services/copiaLibroService.dart';
import 'package:bib_digitalapp/services/libroService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../menu.dart';
import '../modelo/libro.dart';
import '../modelo/reserva.dart';

class VistaDatosLibros extends StatefulWidget {
  const VistaDatosLibros({Key? key}) : super(key: key);

  @override
  State<VistaDatosLibros> createState() => _VistaDatosLibrosState();
}

class _VistaDatosLibrosState extends State<VistaDatosLibros> {
  List<CopiaLibro>? copias;
  bool isDisponible = false;
  bool isLoaded = true;
  var idUsuario =GlobalData.idUser;
  //Libro? libro;

  @override
  void initState() {
    super.initState();
  }

  fetchCopias(Libro l) async {
    copias = await CopiaLibroService.buscarCopias(l);
    if (copias!.isNotEmpty) {
      setState(() {
        isDisponible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Libro? libro = ModalRoute.of(context)!.settings.arguments as Libro?;
    if (libro != null && copias == null) {
      fetchCopias(libro);
    }
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Datos Libro"),
        appBar: AppBar(),
      ),
      drawer: Menu( ),
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
                            libro != null ? libro.titulo : '',
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
                            Flexible(
                                child: Text(libro != null ? libro.autor : '')),
                          ]),
                          Row(
                            children: [
                              const Text("Editorial: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(
                                  child: Text(
                                      libro != null ? libro.editorial : ''))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Año: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(libro != null ? libro.ano.toString() : ''),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Resumen: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(
                                  child:
                                      Text(libro != null ? libro.resumen : ''))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "otroTitulo: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                  child: Text(
                                      libro != null ? libro.otroTitulo : '')),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "cdd: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                  child: Text(libro != null ? libro.cdd : ''))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "isbn: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                  child: Text(libro != null ? libro.isbn : ''))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "tipoMaterial: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                  child: Text(
                                      libro != null ? libro.tipoMaterial : ''))
                            ],
                          ),
                          SizedBox(height: 15),
                          Visibility(

                            child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Colors.green),
                                  onPressed: () => reservar(libro!),
                                  child: const Text("Reservar Libro")),
                            ),
                            visible: isDisponible,
                            replacement: const ElevatedButton(
                                onPressed: null, child: Text("No disponible")),
                          ),
                        ],
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

  Future<void> reservar(Libro libro) async {
    mostrar_dialogo();
    PostReserva postReserva =
        PostReserva(idLibro: libro.idLibro!, duracionHoras: 5, idAlumno: idUsuario);
    Reserva? reserva = await ReservaService.postReserva(postReserva);
    if (reserva != null) {
      Navigator.pop(context);
      Navigator.pushNamed(context, 'reserva', arguments: reserva);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
      Navigator.pop(context);
    }
  }

  void mostrar_dialogo() {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Cargando...')
                ],
              ),
            ),
          );
        });
  }
}
