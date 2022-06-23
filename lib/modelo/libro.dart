// To parse this JSON data, do
//
//     final libro = libroFromJson(jsonString);

import 'dart:convert';

List<Libro> librosFromJson(String str) =>
    List<Libro>.from(json.decode(str).map((x) => Libro.fromJson(x)));

String librosToJson(List<Libro> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Libro libroFromJson(String str) => Libro.fromJson(json.decode(str));

String libroToJson(Libro data) => json.encode(data.toJson());

class Libro {
  Libro({
    this.idLibro = 0,
    required this.titulo,
    required this.autor,
    required this.ano,
    required this.editorial,
    required this.resumen,
    required this.otroTitulo,
    required this.cdd,
    required this.isbn,
    required this.tipoMaterial,
  });

  int idLibro;
  String titulo;
  String autor;
  int ano;
  String editorial;
  String resumen;
  String otroTitulo;
  String cdd;
  String isbn;
  String tipoMaterial;

  factory Libro.fromJson(Map<String, dynamic> json) => Libro(
        idLibro: json["idLibro"],
        titulo: json["titulo"],
        autor: json["autor"],
        ano: json["ano"],
        editorial: json["editorial"],
        resumen: json["resumen"],
        otroTitulo: json["otroTitulo"],
        cdd: json["cdd"],
        isbn: json["isbn"],
        tipoMaterial: json["tipoMaterial"],
      );

  Map<String, dynamic> toJson() => {
        "idLibro": idLibro,
        "titulo": titulo,
        "autor": autor,
        "ano": ano,
        "editorial": editorial,
        "resumen": resumen,
        "otroTitulo": otroTitulo,
        "cdd": cdd,
        "isbn": isbn,
        "tipoMaterial": tipoMaterial,
      };
}
