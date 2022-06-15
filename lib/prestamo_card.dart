import 'package:flutter/material.dart';

import 'modelo/prestamo.dart';

class PrestamoCard extends StatefulWidget {
  Prestamo prestamo;

  PrestamoCard({Key? key, required this.prestamo}) : super(key: key);

  @override
  State<PrestamoCard> createState() => _PrestamoCardState();
}

class _PrestamoCardState extends State<PrestamoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: Colors.grey,
        child: Row(
          children: [
            Expanded(
              flex: 33,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              ),
            ),
            Expanded(
              flex: 66,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Prestamo: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                                child: Text(
                                    widget.prestamo.idPrestamo.toString())),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Fecha inicio: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                                child: Text(widget.prestamo.fechaInicio
                                    .toString()
                                    .split(" ")[0])),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Fecha termino: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                                child: Text(widget.prestamo.fechaTermino
                                    .toString()
                                    .split(" ")[0])),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const Text("Libro nro: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                                child: Text(
                                    widget.prestamo.idCopiaLibro.toString())),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("Libro nombre: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(child: Text("Nombre del libro")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
