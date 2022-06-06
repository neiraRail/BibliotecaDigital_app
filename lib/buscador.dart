import 'dart:convert';

import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:flutter/material.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:http/http.dart' as http;

class VistaBuscador extends StatefulWidget {
  const VistaBuscador({Key? key}) : super(key: key);

  @override
  State<VistaBuscador> createState() => _VistaBuscadorState();
}

class _VistaBuscadorState extends State<VistaBuscador> {
  bool filtro1 = false;
  bool filtro2 = false;

  //inicializar controller

  List<Libro> busqueda = [];

  final busquedaController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Buscador'), appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: busquedaController,
                  ),
                ),
                IconButton(
                  color: Colors.blueAccent,
                  onPressed: () async {
                    busqueda = await buscarPalabra(busquedaController.text);
                    setState(() {});
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: filtro1,
                  onChanged: (valor) {},
                ),
                const Text("filtro 1"),
                Checkbox(
                  value: filtro2,
                  onChanged: (valor) {},
                ),
                const Text("filtro 2")
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () async {
                  busqueda = await buscarPalabra(busquedaController.text);
                  setState(() {});
                },
                child: const Text("Verde"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.grey),
                child: ListView.builder(
                  itemCount: busqueda.length,
                  itemBuilder: (context, i) {
                    return 
                    GestureDetector(
                      onTap:() => Navigator.pushNamed(context, 'datos'),
                      child: LibroCard( libro: busqueda[i]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Libro>> buscarPalabra(palabra) async {
    final response = await http.get(
        Uri.http("200.13.5.14:7102", "/libro/" + palabra, {'q': '{http}'}));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Libro> libros =
          List<Libro>.from(l.map((model) => Libro.fromJson(model)));

      return libros;
    } else {
      return [];
    }
  }
}
