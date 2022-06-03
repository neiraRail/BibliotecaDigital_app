import 'package:flutter/material.dart';

import 'modelo/libro.dart';

class LibroCard extends StatefulWidget {
  final Widget? boton;
  Libro libro;

  LibroCard({Key? key, this.boton, required this.libro}) : super(key: key);

  @override
  State<LibroCard> createState() => _LibroCardState();
}

class _LibroCardState extends State<LibroCard> {
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
                        Text(widget.libro.idLibro.toString()),
                        Text(widget.libro.titulo),
                        Text(widget.libro.autor),
                        Text(widget.libro.ano.toString()),
                        Text(widget.libro.editorial),
                      ],
                    ),
                  ),
                  if (widget.boton != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: widget.boton,
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
