import 'dart:convert';
import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/libro_card.dart';
import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:bib_digitalapp/modelo/prestamo.dart';
import 'package:bib_digitalapp/modelo/reserva.dart';
import 'package:bib_digitalapp/prestamo_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../modelo/libro.dart';
import '../modelo/libro.dart';
import '../services/ReservaService.dart';

class VistaDetalleReserva extends StatefulWidget {
  const VistaDetalleReserva({Key? key}) : super(key: key);
  @override
  State<VistaDetalleReserva> createState() => _VistaDetalleReservaState();
}

class _VistaDetalleReservaState extends State<VistaDetalleReserva> {
  Reserva? reserva;
  String nombre = '';
  String fecha1 = '';
  String fecha2 = '';
  String matricula = '';
  CopiaLibro? copialibro;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  fetchReserva(int numero) async {
    reserva = await ReservaService.getReservaPorId(numero);
    if(reserva!=null){
      print(reservaToJson(reserva!));
      nombre = reserva!.alumno.nombres + " " + reserva!.alumno.apellidos;
      fecha1 = DateFormat('dd-MM-yyyy - kk:mm').format(reserva!.fechaReserva);
      fecha2 = DateFormat('dd-MM-yyyy - kk:mm').format(reserva!.fechaLimite);
      matricula = reserva!.alumno.run;
      copialibro = reserva!.copiaLibro;
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    }

    if (reserva != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  aceptar(id) async {
    //mandar post
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Cargando...')
                ],
              ),
            ),
          );
        });

    var success = await ReservaService.prestamofromReserva(id);
    Navigator.pop(context);
    if(success){
      Navigator.pushNamed(context, 'buscador');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    fetchReserva(args);
    return Scaffold(
        appBar: BaseAppBar(
          title: const Text("Detalles Reserva"),
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        color: Colors.black,
                        onPressed: () => Navigator.pushNamed(context, 'lector'),
                        icon: const Icon(Icons.close)),
                  ),
                  const Text(
                    '''
Detalles de la reserva''',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  if(copialibro!=null) LibroCard(libro: copialibro!.libro),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Alumno",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    nombre + '    ' + matricula,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "fecha Reserva:  " + fecha1,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "fecha Limite:  " + fecha2,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () => aceptar(args),
                    child: 
                    SizedBox(width: 60, height: 20, child: Text('Aceptar') )
                  )
                ),
                 
                ],
              ),
            ),
          ),
          replacement: const Center(
          child: CircularProgressIndicator(),)
        ),
    );
  }
}
