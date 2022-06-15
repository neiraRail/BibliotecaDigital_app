// To parse this JSON data, do
//
//     final prestamo = prestamoFromJson(jsonString);

import 'dart:convert';

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
    required this.idCopiaLibro,
    required this.idAlumno,
  });

  int idPrestamo;
  bool isPrestado;
  DateTime fechaInicio;
  DateTime fechaTermino;
  int idCopiaLibro;
  int idAlumno;

  factory Prestamo.fromJson(Map<String, dynamic> json) => Prestamo(
        idPrestamo: json["idPrestamo"],
        isPrestado: json["isPrestado"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaTermino: DateTime.parse(json["fechaTermino"]),
        idCopiaLibro: json["idCopiaLibro"],
        idAlumno: json["idAlumno"],
      );

  Map<String, dynamic> toJson() => {
        "idPrestamo": idPrestamo,
        "isPrestado": isPrestado,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaTermino": fechaTermino.toIso8601String(),
        "idCopiaLibro": idCopiaLibro,
        "idAlumno": idAlumno,
      };
}
