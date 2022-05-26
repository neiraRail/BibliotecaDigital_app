import 'package:flutter/material.dart';

class CargaLibros extends StatefulWidget {
  const CargaLibros({Key? key}) : super(key: key);

  @override
  State<CargaLibros> createState() => _CargaLibrosState();
}

class _CargaLibrosState extends State<CargaLibros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carga de libros"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            width: 900,
            height: 400,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.file_upload,
                  size: 100,
                ),
                Text("Suelte el archivo aquí")
              ],
            ),
          ),
        ),
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
              onPressed: () {},
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
