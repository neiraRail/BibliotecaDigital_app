// To parse this JSON data, do
//
//     final prestamo = prestamoFromJson(jsonString);

import 'dart:convert';

import 'package:bib_digitalapp/modelo/copiaLibro.dart';

import 'alumno.dart';

List<Prestamo> prestamoFromJson(String str) =>
    List<Prestamo>.from(json.decode(str).map((x) => Prestamo.fromJson(x)));

String prestamoToJson(List<Prestamo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prestamo {
  Prestamo({
    required this.idPrestamo,
    required this.isPrestado,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.copiaLibro,
    required this.alumno,
  });

  int idPrestamo;
  bool isPrestado;
  DateTime fechaInicio;
  DateTime fechaTermino;
  CopiaLibro copiaLibro;
  Alumno alumno;

  factory Prestamo.fromJson(Map<String, dynamic> json) => Prestamo(
        idPrestamo: json["idPrestamo"],
        isPrestado: json["isPrestado"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaTermino: DateTime.parse(json["fechaTermino"]),
        copiaLibro: CopiaLibro.fromJson(json["copiaLibro"]),
        alumno: Alumno.fromJson(json["alumno"]),
      );

  Map<String, dynamic> toJson() => {
        "idPrestamo": idPrestamo,
        "isPrestado": isPrestado,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaTermino": fechaTermino.toIso8601String(),
        "CopiaLibro": copiaLibro,
        "alumno": alumno,
      };
}
