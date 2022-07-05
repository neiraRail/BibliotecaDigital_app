import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

import '../menu.dart';

class CargaErrores extends StatelessWidget {
  const CargaErrores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errores = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: BaseAppBar(title: const Text("Resultado"), appBar: AppBar()),
      drawer: Menu( ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.grey),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.yellow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: const [
                          // The loading indicator
                          Icon(Icons.add_alert, color: Colors.black, size: 40),
                          SizedBox(height: 20),
                          // Some text
                          Text("La subida ha sido parcialmente exitosa",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Se encontraron " +
                          errores.length.toString() +
                          " Libros con errores en el archivo:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: errores.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: index % 2 == 1
                                ? Colors.blueGrey
                                : const Color.fromARGB(255, 106, 148, 173),
                            child: ListTile(
                              title: Text(errores[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, "buscador"),
                        child: const Text('Aceptar')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
