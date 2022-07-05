import 'dart:convert';

import 'package:bib_digitalapp/libro_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../menu.dart';
import '../modelo/libro.dart';
import '../services/libroService.dart';

class BuscadorWeb extends StatefulWidget {
  const BuscadorWeb({Key? key}) : super(key: key);

  @override
  State<BuscadorWeb> createState() => _BuscadorWebState();
}

class _BuscadorWebState extends State<BuscadorWeb> {
  List<Libro> busqueda = [];
  final busquedaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: const Text('Buscador de libross'), appBar: AppBar()),
      drawer: Menu( ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: busquedaController,
              )),
              IconButton(
                color: Colors.blueAccent,
                onPressed: () {
                  buscarPalabra(busquedaController.text);
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              //aqui voy a poner filtros
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.blueGrey),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 7 / 2,
                ),
                itemCount: busqueda.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'datos',
                          arguments: busqueda[i]),
                      child: LibroCard(
                        libro: busqueda[i],
                        boton: Row(children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "editar",
                                  arguments: busqueda[i]);
                            },
                            child: const Text("Editar"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.amber),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialogEliminar(busqueda[i]);
                            },
                            child: const Text("Eliminar"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                          )
                        ]),
                      ));
                },
              ),
            ),
          )
        ]),
      ),
    );
  }

  void showDialogEliminar(Libro libro) {
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color

          backgroundColor: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  const Text("¿Está seguro de eliminar este libro?"),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            eliminarLibro(libro);
                          },
                          child: const Text("Si")),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void eliminarLibro(Libro libro) async {
    mostrarDialog();
    var response = await LibroService.deleteLibro(libro);
    if (response == true) {
      Navigator.pop(context);
      mostrarDialogExito();
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void mostrarDialogExito() {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            //backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  const Icon(Icons.add_alert, color: Colors.green, size: 40),
                  const SizedBox(height: 20),
                  // Some text
                  const Text('Libro eliminado exitosamente',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          Navigator.pop(context);
                          buscarPalabra(busquedaController.text);
                        },
                        child: const Text('Aceptar')),
                  )
                ],
              ),
            ),
          );
        });
  }

  void buscarPalabra(palabra) async {
    mostrarDialog();
    var libros = await LibroService.buscarPalabra(palabra);
    if (libros != null) {
      busqueda = libros;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    }
    Navigator.pop(context);
  }

  void mostrarDialog() {
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
      },
    );
  }
}
