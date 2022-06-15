import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:bib_digitalapp/services/prestamoService.dart';
import 'package:flutter/material.dart';

import 'modelo/prestamo.dart';

class VistaHistorial extends StatefulWidget {
  const VistaHistorial({Key? key}) : super(key: key);

  @override
  State<VistaHistorial> createState() => _VistaHistorialState();
}

class _VistaHistorialState extends State<VistaHistorial> {
  bool isLoaded = false;
  List<Prestamo>? prestamos;

  @override
  void initState() {
    super.initState();

    fetchPrestamos();
  }

  fetchPrestamos() async {
    prestamos = await PrestamoService.getPrestamosPorAlumno(1);
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
                    itemCount: prestamos?.length,
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
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
