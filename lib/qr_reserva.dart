import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:bib_digitalapp/modelo/reserva.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:http/http.dart' as http;

class VistaReservaQR extends StatefulWidget {
  const VistaReservaQR({Key? key}) : super(key: key);

  @override
  State<VistaReservaQR> createState() => _VistaReservaQRState();
}

class _VistaReservaQRState extends State<VistaReservaQR> {
  @override
  Widget build(BuildContext context) {
    final reserva = ModalRoute.of(context)!.settings.arguments as Reserva;

    String horaMax = DateFormat('kk:mm').format(reserva.fechaLimite);
    int id = reserva.idReserva;
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("QR Reserva"),
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
                  child: QrImage(
                      data: id.toString(), version: QrVersions.auto, size: 280),
                ),
              ),
              const Text("Hora máxima para retirar libro: "),
              Text(horaMax),
              LibroCard(
                libro: reserva.copiaLibro.libro,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () => Navigator.pushNamed(context, 'buscador'),
                child: const Text("Cancelar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
