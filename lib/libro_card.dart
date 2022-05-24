import 'package:flutter/material.dart';

class LibroCard extends StatefulWidget {
  final Widget? boton;

  const LibroCard({Key? key, this.boton}) : super(key: key);

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
                      children: const [
                        Text("Titulo del libro"),
                        Text("Descripión del libro"),
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
