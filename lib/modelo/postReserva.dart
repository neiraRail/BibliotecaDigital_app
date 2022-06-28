// To parse this JSON data, do
//
//     final postReserva = postReservaFromJson(jsonString);

import 'dart:convert';

PostReserva postReservaFromJson(String str) => PostReserva.fromJson(json.decode(str));

String postReservaToJson(PostReserva data) => json.encode(data.toJson());
class PostReserva {
    PostReserva({
        required this.idLibro,
        required this.duracionHoras,
        required this.idAlumno,
    });

    int idLibro;
    int duracionHoras;
    int idAlumno;

    factory PostReserva.fromJson(Map<String, dynamic> json) => PostReserva(
        idLibro: json["idLibro"],
        duracionHoras: json["duracionHoras"],
        idAlumno: json["idAlumno"],
    );

    Map<String, dynamic> toJson() => {
        "idLibro": idLibro,
        "duracionHoras": duracionHoras,
        "idAlumno": idAlumno,
    };
}