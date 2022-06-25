import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/prestamo.dart';
import 'package:bib_digitalapp/services/alumnoService.dart';
import 'package:bib_digitalapp/services/prestamoService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bib_digitalapp/base_app_bar.dart';

import '../modelo/alumno.dart';
import '../modelo/libro.dart';
import '../prestamo_card.dart';

class historialWeb extends StatefulWidget {
  const historialWeb({Key? key}) : super(key: key);

  @override
  State<historialWeb> createState() => _historialWebState();
}

class _historialWebState extends State<historialWeb> {
  List<Prestamo>? prestamos;
  List<Alumno>? alumnos;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchPrestamos();
  }

  fetchPrestamos() async {
    prestamos = await PrestamoService.getPrestamos();
    alumnos = await AlumnoService.getAlumnos();
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
          title: const Text('Historial de préstamos'), appBar: AppBar()),
      body: Visibility(
        visible: isLoaded,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(children: [
            Row(
              children: [
                const Expanded(child: TextField()),
                IconButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //aqui voy a poner filtros
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 7 / 2,
                  ),
                  itemCount: prestamos?.length,
                  itemBuilder: (context, i) {
                    return PrestamoCard(
                      prestamo: prestamos![i],
                      alumno: alumnos
                          ?.where((element) =>
                              element.idAlumno == prestamos![i].alumno.idAlumno)
                          .first,
                    );
                  },
                ),
              ),
            )
          ]),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
