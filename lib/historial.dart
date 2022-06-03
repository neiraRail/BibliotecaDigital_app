import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:flutter/material.dart';

class VistaHistorial extends StatefulWidget {
  const VistaHistorial({Key? key}) : super(key: key);

  @override
  State<VistaHistorial> createState() => _VistaHistorialState();
}

class _VistaHistorialState extends State<VistaHistorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Historial"),
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
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 20,
              color: Colors.grey[700],
              child: const SizedBox.expand(
                child: Center(
                  child: Text("Reservas activas"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.grey),
                child: ListView.builder(
                  itemCount: 2,
                  primary: false,
                  itemBuilder: (context, i) {
                    return LibroCard(
                      libro: Libro(),
                      boton: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {},
                          child: const Text("Cancelar")),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 20,
              color: Colors.grey[700],
              child: const SizedBox.expand(
                child: Center(
                  child: Text("Historial de reservas"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.grey),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return LibroCard(
                      libro: Libro(),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
