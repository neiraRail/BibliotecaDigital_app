import 'dart:convert';

import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:bib_digitalapp/services/copiaLibroService.dart';
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
      appBar:
          BaseAppBar(title: const Text('Buscador de libros'), appBar: AppBar()),
      drawer: Menu(),
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
                              mostrar_dialogo_copias(busqueda[i]);
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

  void mostrar_dialogo_copias(Libro libro) async {
    List<CopiaLibro> copias = await CopiaLibroService.buscarCopias(libro);
    if (copias.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No hay ejemplares de este libro"),
        backgroundColor: Colors.red,
      ));
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text.rich(
                  TextSpan(children: [
                    const TextSpan(text: "Ejemplares de "),
                    TextSpan(
                        text: libro.titulo,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ": ")
                  ]),
                ),
                content: SizedBox(
                  width: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: copias.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: (() => Navigator.pushReplacementNamed(
                              context, 'reserva')),
                          child: ListTile(
                            title: Text(
                                "copia " + copias[i].idEspecifico.toString()),
                            subtitle: Text("Estado: " + copias[i].estado),
                            trailing: IconButton(
                                onPressed: () {
                                  showDialogEliminar(copias[i]);
                                },
                                icon: const Icon(Icons.delete)),
                            tileColor: Colors.grey[300],
                            hoverColor: Colors.grey,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                        );
                      }),
                ),
              ),
          barrierDismissible: true);
    }
  }

  void showDialogEliminar(CopiaLibro libro) {
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

  void eliminarLibro(CopiaLibro libro) async {
    mostrarDialog();
    try {
      var response = await CopiaLibroService.deleteLibro(libro);
      if (response == true) {
        Navigator.pop(context);
        mostrarDialogExito(libro.libro);
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Hubo un error"),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Hubo un error: No se puede eliminar esta copia pues está asociada a prestamos activos o anteriores"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void mostrarDialogExito(Libro libro) {
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
                          Navigator.pop(context); //Quitar dialogo exito
                          Navigator.pop(context); //Quitar dialogo copias
                          mostrar_dialogo_copias(libro);
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
