import 'dart:convert';

import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:bib_digitalapp/services/copiaLibroService.dart';
import 'package:bib_digitalapp/services/libroService.dart';
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

  List<Libro>? busqueda = [];

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
                    busqueda = await LibroService.buscarPalabra(
                        busquedaController.text);
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
                  itemCount: busqueda!.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'datos',
                          arguments: busqueda![i]),
                      child: LibroCard(libro: busqueda![i]),
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
}
