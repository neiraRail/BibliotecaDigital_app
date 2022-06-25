import 'dart:convert';

import 'libro.dart';
List<CopiaLibro> copialibrosFromJson(String str) =>
    List<CopiaLibro>.from(json.decode(str).map((x) => Libro.fromJson(x)));

Libro copiaLibroFromJson(String str) {
  return Libro.fromJson(jsonDecode(str));
}

String copiaLibroToJson(List<CopiaLibro> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CopiaLibro {
  int idEspecifico;
  String estado;
  Libro libro;

  CopiaLibro({
    required this.idEspecifico,
    required this.estado,
    required this.libro,
  });

  factory CopiaLibro.fromJson(dynamic json) {
    return CopiaLibro(
      idEspecifico: json['idEspecifico'],
      estado: json['estado'],
      libro: Libro.fromJson(json['libro']),
    );
  }
   
  Map<String, dynamic> toJson() => {
        "idEspecifico": idEspecifico,
        "estado": estado,
        "ibro": libro,
      };
}
