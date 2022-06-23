import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bib_digitalapp/services/libroService.dart';

import '../modelo/libro.dart';

class subidaManual extends StatefulWidget {
  const subidaManual({Key? key}) : super(key: key);

  @override
  State<subidaManual> createState() => _subidaManualState();
}

class _subidaManualState extends State<subidaManual> {
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  final anoController = TextEditingController();
  final editorialController = TextEditingController();
  final resumenController = TextEditingController();
  final otrotituloController = TextEditingController();
  final cddController = TextEditingController();
  final isbnController = TextEditingController();
  final tipomaterialController = TextEditingController();

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Añadir libro'), appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Titulo: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: tituloController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Autor: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: autorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Editorial: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: editorialController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Año:'),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: anoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('ISBN: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: isbnController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('CDD:'),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: cddController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Resumen: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: resumenController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Otro título: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: otrotituloController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('Tipo Material: '),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: tipomaterialController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                onPressed: () {
                  guardarLibro();
                },
                child: const Text("Guardar"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void guardarLibro() async {
    try {
      Libro libro = Libro(
          titulo: tituloController.text,
          autor: autorController.text,
          ano: int.parse(anoController.text),
          editorial: editorialController.text,
          resumen: resumenController.text,
          otroTitulo: otrotituloController.text,
          cdd: cddController.text,
          isbn: isbnController.text,
          tipoMaterial: tipomaterialController.text);

      Libro? libroGuardado = await LibroService.postLibro(libro);
      Navigator.pushReplacementNamed(context, "datos",
          arguments: libroGuardado);
    } catch (e) {
      setState(() {
        tituloController.clear();
        autorController.clear();
        anoController.clear();
        editorialController.clear();
        resumenController.clear();
        otrotituloController.clear();
        cddController.clear();
        isbnController.clear();
        tipomaterialController.clear();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Hubo un error"),
          backgroundColor: Colors.red,
        ));
      });
    }
  }
}
