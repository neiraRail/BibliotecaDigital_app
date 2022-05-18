import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

class VistaReservaQR extends StatefulWidget {
  const VistaReservaQR({Key? key}) : super(key: key);

  @override
  State<VistaReservaQR> createState() => _VistaReservaQRState();
}

class _VistaReservaQRState extends State<VistaReservaQR> {
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
          child: Column(
            children: [
              const Text(
                '''
Reserva realizada exitosamente''',
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                flex: 33,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://picsum.photos/201',
                  ),
                ),
              ),
              const Text("Hora máxima para retirar libro"),
              SizedBox(
                height: 150,
                child: Card(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Image.network(
                          'https://picsum.photos/200',
                        ),
                      ),
                      Expanded(
                        flex: 66,
                        child: Column(
                          children: const [
                            Text("Titulo del libro"),
                            Text("Descripión del libro")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {},
                child: const Text("Cancelar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
