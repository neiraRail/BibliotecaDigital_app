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
    this.idLibro,
    required this.titulo,
    required this.autor,
    this.ano = 0,
    this.editorial = '',
    this.resumen = '',
    this.otroTitulo = "",
    this.cdd = "",
    this.isbn = "",
    this.tipoMaterial = "",
  });
  int? idLibro;
  String titulo;
  String autor;
  int ano = 0;
  String editorial = '';
  String resumen = '';
  String otroTitulo = "string";
  String cdd = "string";
  String isbn = "string";
  String tipoMaterial = "Novela";

  factory Libro.fromJson(dynamic json) {
    return Libro(
      idLibro: json['idLibro'],
      titulo: json['titulo'],
      autor: json['autor'],
      ano: json['ano'],
      editorial: json['editorial'],
      resumen: json['resumen'],
      otroTitulo: json['otroTitulo'],
      cdd: json["cdd"],
      isbn: json["isbn"],
      tipoMaterial: json["tipoMaterial"],
    );
  }

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
