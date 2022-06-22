import 'package:bib_digitalapp/modelo/alumno.dart';
import 'dart:convert';

import 'package:bib_digitalapp/modelo/copiaLibro.dart';


List<Reserva> reservaFromJson(String str) =>
    List<Reserva>.from(json.decode(str).map((x) => Reserva.fromJson(x)));

String reservaToJson(List<Reserva> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reserva {
  Reserva({
    required this.idReserva,
    required this.copiaLibro,
    required this.alumno ,
    required  this.fecha
  });
  int idReserva;
  CopiaLibro copiaLibro;
  Alumno alumno;
  DateTime fecha;


  factory Reserva.fromJson(Map<String,dynamic>json) => Reserva(
        idReserva: json["idReserva"],
        copiaLibro: json["copiaLibro"],
        alumno: json["alumno"],
        fecha: DateTime.parse(json["fecha"])
        );
  Map<String, dynamic> toJson() => {
        "idReserva": idReserva,
        "copiaLibro": copiaLibro,
        "fecha": fecha.toIso8601String(),
        "alumno": alumno,
      };
  }