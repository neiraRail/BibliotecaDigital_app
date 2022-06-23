import 'libro.dart';

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
}
