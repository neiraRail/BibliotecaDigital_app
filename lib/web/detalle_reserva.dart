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

import 'package:http/http.dart' as http;

import '../modelo/libro.dart';
import '../modelo/libro.dart';
import '../services/ReservaService.dart';


class VistaDetalleReserva extends StatefulWidget {
  const VistaDetalleReserva({Key? key}) : super(key: key);

  @override
  State<VistaDetalleReserva> createState() => _VistaDetalleReservaState();
}

class _VistaDetalleReservaState extends State<VistaDetalleReserva>
 {
    Reserva? reserva ;
    int id = 1;
    String nombre= '';
    String fecha='';
    String matricula='';
    CopiaLibro? copialibro;
  final busquedaController = TextEditingController();
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    fetchReserva();
  }
  
  fetchReserva() async {
    reserva = await ReservaService.getReserva(id) ;
    
    if (reserva != null) {
      nombre=reserva!.alumno.nombres+reserva!.alumno.apellidos;
      fecha=reserva!.fecha.toIso8601String();
      matricula=reserva!.alumno.run;
      copialibro=reserva!.copiaLibro;
      setState(() {
        isLoaded = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    
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
                   onPressed:()=>{}, icon: const Icon (Icons.close)),
              ),
              const Text(
                '''
Detalles de la reserva''',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25
              ,),

              LibroCard(libro: copialibro!.libro),
              const SizedBox(height: 20,),
              const Text("Alumno", style: TextStyle(fontSize:18) ,),
              const SizedBox(height: 15,),
              Text(
                nombre+'    '+matricula+ '''
                '''+fecha,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 60,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () => Navigator.pushNamed(context, 'buscador'),
                child: const Text("Aceptar"),
              ),


            ],
          ),
        ),
      ),
    ));
  }
  Future<List<Libro>> buscarPalabra(id) async {
    final response = await http.get(Uri.http(
        "200.13.5.14:7102", "/api/Libro/" , {'q': '{http}'}));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Libro> libros =
          List<Libro>.from(l.map((model) => Libro.fromJson(model)));

      return libros;
    } else {
      return [];
    }
  }
}
