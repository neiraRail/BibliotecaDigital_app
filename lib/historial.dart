import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:bib_digitalapp/prestamo_card.dart';
import 'package:bib_digitalapp/services/prestamoService.dart';
import 'package:flutter/material.dart';

import 'menu.dart';
import 'modelo/prestamo.dart';

class VistaHistorial extends StatefulWidget {
  const VistaHistorial({Key? key}) : super(key: key);

  @override
  State<VistaHistorial> createState() => _VistaHistorialState();
}

class _VistaHistorialState extends State<VistaHistorial> {
  bool isLoaded = false;
  List<Prestamo>? prestamos;
  List<Prestamo>? prestamosActivos;
  List<Prestamo>? prestamosAntiguos;

  @override
  void initState() {
    super.initState();

    fetchPrestamos();
  }

  fetchPrestamos() async {
    prestamos = await PrestamoService.getPrestamosPorAlumno(2);

    prestamosActivos =
        prestamos?.where((element) => element.isPrestado == true).toList();
    prestamosAntiguos =
        prestamos?.where((element) => element.isPrestado == false).toList();

    if (prestamos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Historial"),
        appBar: AppBar(),
      ),
      drawer: Menu( ),
      body: Visibility(
        visible: isLoaded,
        child: Padding(
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
                    child: Text("Prestamos activos"),
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
                    itemCount: prestamosActivos?.length,
                    primary: false,
                    itemBuilder: (context, i) {
                      return PrestamoCard(
                        prestamo: prestamosActivos![i],
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
                    child: Text("Prestamos"),
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
                    itemCount: prestamosAntiguos?.length,
                    itemBuilder: (context, i) {
                      return PrestamoCard(
                        prestamo: prestamosAntiguos![i],
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
