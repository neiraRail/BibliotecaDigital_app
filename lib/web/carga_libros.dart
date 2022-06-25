import 'package:bib_digitalapp/web/drop_zone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../modelo/file_DataModel.dart';
import '../services/archivoService.dart';
import 'dropped_file_widget.dart';

class CargaLibros extends StatefulWidget {
  const CargaLibros({Key? key}) : super(key: key);

  @override
  State<CargaLibros> createState() => _CargaLibrosState();
}

class _CargaLibrosState extends State<CargaLibros> {
  late DropzoneViewController controller;
  File_Data_Model? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carga de libros"),
      ),
      body: Column(children: [
        DropZoneWidget(
          onDroppedFile: (file) => setState(
            () => {this.file = file},
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DroppedFileWidget(file: file),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {},
              child: const SizedBox(
                height: 40,
                width: 100,
                child: Center(
                  child: Text("Cancelar"),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                try {
                  ArchivoService.enviar(file);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Hubo un error"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const SizedBox(
                height: 40,
                width: 100,
                child: Center(
                  child: Text("Aceptar"),
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
          ],
        )
      ]),
    );
  }
}
