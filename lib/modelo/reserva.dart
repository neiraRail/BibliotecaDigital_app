import 'package:bib_digitalapp/modelo/alumno.dart';
import 'dart:convert';

import 'package:bib_digitalapp/modelo/copiaLibro.dart';


List<Reserva> reservasFromJson(String str) =>
    List<Reserva>.from(json.decode(str).map((x) => Reserva.fromJson(x)));

Reserva reservaFromJson(String str) {
    return Reserva.fromJson(jsonDecode(str));}


String reservaToJson(List<Reserva> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reserva {
  Reserva({
    required this.idReserva,
    required  this.fechaReserva,
    required  this.fechaLimite,
    required this.copiaLibro,
    required this.alumno ,
    
  });
  int idReserva;
  DateTime fechaReserva;
  DateTime fechaLimite;
  CopiaLibro copiaLibro;
  Alumno alumno;
  

  factory Reserva.fromJson(Map<String,dynamic>json) => Reserva(
        idReserva: json["idReserva"],
        fechaReserva: DateTime.parse(json["fechaReserva"]),
        fechaLimite: DateTime.parse(json["fechaLimite"]),
        copiaLibro: CopiaLibro.fromJson(json["copiaLibro"]),
        alumno: json["alumno"],
        );

  Map<String, dynamic> toJson() => {
        "idReserva": idReserva,
        "fechaReserva": fechaReserva.toIso8601String(),
        "fechaLimite": fechaLimite.toIso8601String(),
        "copiaLibro": copiaLibro,
        "alumno": alumno,
      };
  }